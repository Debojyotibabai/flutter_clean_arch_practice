import 'package:clean_architecture_rivaan_ranawat/features/dashboard/domain/entities/food_category_entity.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/constants.dart';

class GetAllGroupsParams {
  final int page;
  final int size;

  GetAllGroupsParams({
    required this.page,
    required this.size,
  });
}

class UpdateGroupDetailsParams {
  final String groupId;
  final String groupName;
  final String city;
  final String state;

  UpdateGroupDetailsParams({
    required this.groupId,
    required this.groupName,
    required this.city,
    required this.state,
  });
}

class GetGroupRecommendationsParams {
  final String groupId;
  final FoodCategoryEntity? restaurantCategoryIds;
  final GroupRecommendedFoodsSortByOption? sortBy;
  final double latitude;
  final double longitude;
  final String unit;
  final int page;
  final int size;

  GetGroupRecommendationsParams({
    required this.groupId,
    required this.restaurantCategoryIds,
    required this.sortBy,
    required this.latitude,
    required this.longitude,
    required this.unit,
    required this.page,
    required this.size,
  });
}
