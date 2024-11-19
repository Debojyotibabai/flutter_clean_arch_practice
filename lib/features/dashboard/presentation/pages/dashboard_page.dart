import 'package:clean_architecture_rivaan_ranawat/features/dashboard/presentation/bloc/food_category/food_category_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/presentation/bloc/recommendation/recommendation_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/presentation/widgets/recommendation_card.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/widgets/dropdown/dropdown_with_icon.dart';
import 'package:flutter/material.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  RecommendedFoodsSortByOption? selectedSortByOption;
  String? restaurantCategoryIds;

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
        restaurantCategoryIds: restaurantCategoryIds,
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
                            selectedSortByOption =
                                Constants.recommendedFoodsSortByOptions[index!];
                          });

                          getRecommendation();
                        },
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
                                  restaurantCategoryIds = state
                                      .foodCategory[index!]
                                      .restaurantCategoryId;
                                });

                                getRecommendation();
                              },
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
                      if (state.recommendations.isEmpty) {
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
                            itemCount: state.recommendations.length,
                            itemBuilder: (context, index) {
                              return RecommendationCard(
                                foodName:
                                    state.recommendations[index].foodItemName,
                                restaurantName:
                                    state.recommendations[index].restaurantName,
                                rating: state.recommendations[index]
                                        .givenPercentage ??
                                    state.recommendations[index]
                                        .matchPercentage ??
                                    0,
                                distance: state.recommendations[index]
                                    .addressDistanceFromMyLocation,
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
          ],
        ),
      ),
    );
  }
}
