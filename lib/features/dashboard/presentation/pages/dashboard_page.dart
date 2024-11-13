import 'package:clean_architecture_rivaan_ranawat/features/dashboard/presentation/bloc/food_category/food_category_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/presentation/widgets/recommendation_card.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/widgets/dropdown/dropdown_with_icon.dart';
import 'package:flutter/material.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  final int unit = 10;
  final double latitude = 40.758701;
  final double longitude = -111.876183;

  @override
  void initState() {
    BlocProvider.of<FoodCategoryBloc>(context).add(GetFoodCategoryEvent());
    super.initState();
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
            const Padding(
              padding: EdgeInsets.all(20),
              child: RecommendationCard(),
            ),
          ],
        ),
      ),
    );
  }
}
