import 'package:clean_architecture_rivaan_ranawat/features/dashboard/domain/entities/food_category_entity.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/presentation/bloc/food_category/food_category_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/presentation/widgets/edit_group_details.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/presentation/widgets/group_recommendation_card.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/presentation/widgets/view_participants_card.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/constants.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/widgets/dropdown/dropdown_with_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  RecommendedFoodsSortByOption? selectedSortByOption;
  FoodCategoryEntity? restaurantCategoryIds;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<FoodCategoryBloc>(context).add(GetFoodCategoryEvent());
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
                ),
                const SizedBox(height: 30),
                const ViewParticipantsCard(),
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
                      options: Constants.recommendedFoodsSortByOptions
                          .map((item) => item.label)
                          .toList(),
                      onChanged: (index) {
                        setState(() {});
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
                              setState(() {});
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
          const GroupRecommendationCard(),
        ],
      ),
    );
  }
}
