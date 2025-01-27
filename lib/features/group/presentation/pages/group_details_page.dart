import 'dart:async';

import 'package:clean_architecture_rivaan_ranawat/config/navigation/routes.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/domain/entities/food_category_entity.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/presentation/bloc/food_category/food_category_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/presentation/bloc/get_foods_as_per_restaurants/get_food_as_per_restaurants_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/presentation/bloc/get_group_recommendations/get_group_recommendations_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/presentation/widgets/edit_group_details.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/presentation/widgets/group_recommendation_card.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/presentation/widgets/view_participants_card.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/constants.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/models/group_model.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/widgets/button/app_primary_solid_button.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/widgets/dropdown/dropdown_with_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

class GroupDetailsPage extends StatefulWidget {
  const GroupDetailsPage({
    super.key,
    required this.groupId,
  });

  final String groupId;

  @override
  State<GroupDetailsPage> createState() => _GroupDetailsPageState();
}

class _GroupDetailsPageState extends State<GroupDetailsPage> {
  FoodCategoryEntity? restaurantCategoryIds;
  GroupRecommendedFoodsSortByOption? selectedSortByOption;

  double latitude = 40.758701;
  double longitude = -111.876183;
  String unit = "Mile";
  int page = 1;
  int size = 10;

  Timer? timerForRecallingRecommendations;

  List<String>? restaurantIdsForFEtchRecommendations = [];

  void getGroupRecommendations() {
    timerForRecallingRecommendations?.cancel();

    BlocProvider.of<GetGroupRecommendationsBloc>(context).add(
      GetGroupRecommendations(
        params: GetGroupRecommendationsParams(
          groupId: widget.groupId,
          restaurantCategoryIds: restaurantCategoryIds,
          sortBy: selectedSortByOption,
          latitude: latitude,
          longitude: longitude,
          unit: unit,
          page: page,
          size: size,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<FoodCategoryBloc>(context).add(GetFoodCategoryEvent());

    getGroupRecommendations();
  }

  Future<void> onRefresh() async {
    setState(() {
      restaurantCategoryIds = null;
      selectedSortByOption = null;
      page = 1;
      size = 10;
    });

    getGroupRecommendations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 29,
            color: Colors.white,
          ),
          onPressed: () => context.pop(),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                EditGroupDetails(
                  groupId: widget.groupId,
                  getGroupRecommendations: getGroupRecommendations,
                ),
                const SizedBox(height: 30),
                ViewParticipantsCard(
                  onTap: () => context.pushNamed(
                    Routes.groupParticipants,
                    pathParameters: {
                      "groupId": widget.groupId,
                    },
                  ),
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
          Container(
            color: Colors.red[900],
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 13,
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: DropdownWithIcon(
                      selectTitle: "Sort by",
                      options: Constants.groupRecommendedFoodsSortByOptions
                          .map((item) => item.label)
                          .toList(),
                      onChanged: (index) {
                        setState(() {
                          selectedSortByOption = Constants
                              .groupRecommendedFoodsSortByOptions[index!];
                        });

                        getGroupRecommendations();
                      },
                      resetValue: selectedSortByOption?.label,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: BlocBuilder<FoodCategoryBloc, FoodCategoryState>(
                      builder: (context, getFoodCategoryState) {
                        if (getFoodCategoryState is GetFoodCategorySuccess) {
                          return DropdownWithIcon(
                            selectTitle: "Filter",
                            options: getFoodCategoryState.foodCategory
                                .map((e) => e.restaurantCategoryName)
                                .toList(),
                            onChanged: (index) {
                              setState(() {
                                restaurantCategoryIds =
                                    getFoodCategoryState.foodCategory[index!];
                              });

                              getGroupRecommendations();
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
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Your Group Recommendations",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
            ),
          ),
          Expanded(
            child: BlocConsumer<GetGroupRecommendationsBloc,
                GetGroupRecommendationsState>(
              listener: (context, getGroupRecommendationsState) {
                if (getGroupRecommendationsState
                    is GetGroupRecommendationsSuccess) {
                  if (getGroupRecommendationsState.recommendations.message !=
                          null &&
                      getGroupRecommendationsState.recommendations.message !=
                          "" &&
                      getGroupRecommendationsState
                          .recommendations.restaurantRecommendations!.isEmpty) {
                    setState(() {
                      timerForRecallingRecommendations =
                          Timer(const Duration(seconds: 30), () async {
                        onRefresh();
                      });
                    });
                  } else if (getGroupRecommendationsState
                      .recommendations.restaurantRecommendations!.isNotEmpty) {
                    setState(() {
                      restaurantIdsForFEtchRecommendations =
                          getGroupRecommendationsState
                              .recommendations.restaurantRecommendations!
                              .map((e) => e.restaurantId!)
                              .toList();
                    });

                    BlocProvider.of<GetFoodAsPerRestaurantsBloc>(context).add(
                      GetFoodAsPerRestaurants(
                        restaurantIds: restaurantIdsForFEtchRecommendations!,
                      ),
                    );
                  }
                }
              },
              builder: (context, getGroupRecommendationsState) {
                if (getGroupRecommendationsState
                    is GetGroupRecommendationsLoading) {
                  return SpinKitThreeInOut(
                    color: Colors.yellow[700],
                  );
                } else if (getGroupRecommendationsState
                    is GetGroupRecommendationsSuccess) {
                  if (getGroupRecommendationsState.recommendations.message !=
                          null &&
                      getGroupRecommendationsState.recommendations.message !=
                          "" &&
                      getGroupRecommendationsState
                          .recommendations.restaurantRecommendations!.isEmpty) {
                    return Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              getGroupRecommendationsState
                                  .recommendations.message!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 20),
                            AppPrimarySoidButton(
                              onPressed: onRefresh,
                              buttonText: "Reload Again",
                              width: 0.6,
                              backgroundColor: Colors.yellow[700]!,
                              isLoading: getGroupRecommendationsState
                                  is GetGroupRecommendationsLoading,
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return RefreshIndicator(
                      onRefresh: onRefresh,
                      child: ListView.builder(
                        itemCount: getGroupRecommendationsState
                            .recommendations.restaurantRecommendations?.length,
                        itemBuilder: (context, index) {
                          return GroupRecommendationCard(
                            restaurantName: getGroupRecommendationsState
                                .recommendations
                                .restaurantRecommendations![index]
                                .restaurantName!,
                            distance: getGroupRecommendationsState
                                .recommendations
                                .restaurantRecommendations![index]
                                .nearestRestaurantAddress!
                                .nearestRestaurantAddressDistance!,
                            groupMatch: getGroupRecommendationsState
                                .recommendations
                                .restaurantRecommendations![index]
                                .averagePercentage!,
                            onTap: () {
                              context.pushNamed(
                                Routes.recommendationDetails,
                                pathParameters: {
                                  "restaurantAddressId":
                                      getGroupRecommendationsState
                                          .recommendations
                                          .restaurantRecommendations![index]
                                          .nearestRestaurantAddress!
                                          .nearestRestaurantAddressId!,
                                },
                                extra: getGroupRecommendationsState
                                    .recommendations
                                    .restaurantRecommendations![index]
                                    .restaurantId,
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
        ],
      ),
    );
  }
}
