import 'package:clean_architecture_rivaan_ranawat/config/navigation/routes.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/domain/entities/food_category_entity.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/presentation/bloc/food_category/food_category_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/presentation/bloc/recommendation/recommendation_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/presentation/widgets/recommendation_card.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/widgets/dropdown/dropdown_with_icon.dart';
import 'package:flutter/material.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  RecommendedFoodsSortByOption? selectedSortByOption;
  FoodCategoryEntity? restaurantCategoryIds;

  int page = 1;

  final int size = 10;
  final String unit = "Mile";
  final double latitude = 40.758701;
  final double longitude = -111.876183;

  @override
  void initState() {
    BlocProvider.of<FoodCategoryBloc>(context).add(GetFoodCategoryEvent());
    getRecommendation();
    super.initState();
  }

  void getRecommendation() {
    BlocProvider.of<RecommendationBloc>(context).add(
      GetRecommendationEvent(
        page: page,
        size: size,
        latitude: latitude,
        longitude: longitude,
        unit: unit,
        sortByOption: selectedSortByOption,
        restaurantCategoryIds: restaurantCategoryIds?.restaurantCategoryId,
      ),
    );
  }

  Future<void> _handleRefresh() async {
    setState(() {
      page = 1;
      selectedSortByOption = null;
      restaurantCategoryIds = null;
    });

    getRecommendation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.red[900],
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 13, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: DropdownWithIcon(
                        selectTitle: "Sort by",
                        options: Constants.recommendedFoodsSortByOptions
                            .map((item) => item.label)
                            .toList(),
                        onChanged: (index) {
                          setState(() {
                            page = 1;
                            selectedSortByOption =
                                Constants.recommendedFoodsSortByOptions[index!];
                          });

                          getRecommendation();
                        },
                        resetValue: selectedSortByOption?.label,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: BlocBuilder<FoodCategoryBloc, FoodCategoryState>(
                        builder: (context, state) {
                          if (state is GetFoodCategorySuccess) {
                            return DropdownWithIcon(
                              selectTitle: "Filter",
                              options: state.foodCategory
                                  .map((e) => e.restaurantCategoryName)
                                  .toList(),
                              onChanged: (index) {
                                setState(() {
                                  page = 1;
                                  restaurantCategoryIds =
                                      state.foodCategory[index!];
                                });

                                getRecommendation();
                              },
                              resetValue:
                                  restaurantCategoryIds?.restaurantCategoryName,
                            );
                          }
                          return const DropdownWithIcon(
                            selectTitle: "Filter",
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: _handleRefresh,
                child: BlocBuilder<RecommendationBloc, RecommendationState>(
                  builder: (context, state) {
                    if (state is RecommendationLoading) {
                      return Center(
                        child: SpinKitThreeInOut(
                          color: Colors.yellow[700],
                        ),
                      );
                    } else if (state is RecommendationSuccess) {
                      if (state.recommendations.recommendedFoods!.isEmpty) {
                        return const Center(
                          child: Text(
                            "No recommendations found",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      } else {
                        return Container(
                          margin: const EdgeInsets.only(top: 15),
                          child: ListView.builder(
                            itemCount:
                                state.recommendations.recommendedFoods?.length,
                            itemBuilder: (context, index) {
                              return RecommendationCard(
                                id: state.recommendations
                                    .recommendedFoods![index].id!,
                                foodName: state.recommendations
                                    .recommendedFoods![index].foodItemName!,
                                restaurantName: state.recommendations
                                    .recommendedFoods![index].restaurantName!,
                                rating: state
                                        .recommendations
                                        .recommendedFoods![index]
                                        .givenPercentage ??
                                    state
                                        .recommendations
                                        .recommendedFoods![index]
                                        .matchPercentage ??
                                    0,
                                distance: state
                                    .recommendations
                                    .recommendedFoods![index]
                                    .addressDistanceFromMyLocation!,
                                isReportFoodOptionVisible: state
                                    .recommendations
                                    .recommendedFoods![index]
                                    .isReportFoodOptionVisible!,
                                isDealAvailable: state.recommendations
                                    .recommendedFoods![index].deals!.isNotEmpty,
                                onTap: () {
                                  context.goNamed(
                                    Routes.recommendationDetails,
                                    pathParameters: {
                                      "restaurantAddressId": state
                                          .recommendations
                                          .recommendedFoods![index]
                                          .nearestLocationRestaurantAddressId!,
                                    },
                                    extra: state
                                        .recommendations
                                        .recommendedFoods![index]
                                        .restaurant!
                                        .restaurantId!,
                                  );
                                },
                              );
                            },
                          ),
                        );
                      }
                    }
                    return Container();
                  },
                ),
              ),
            ),
            BlocBuilder<RecommendationBloc, RecommendationState>(
              builder: (context, state) {
                if (state is RecommendationSuccess &&
                    state.recommendations.pagination!.totalItems! >
                        state.recommendations.recommendedFoods!.length) {
                  return Center(
                    child: GestureDetector(
                      onTap: () {
                        page++;

                        getRecommendation();
                      },
                      child: const Text(
                        "Load More",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
