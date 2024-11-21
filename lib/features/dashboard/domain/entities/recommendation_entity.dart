abstract class PaginationEntity {
  final int? totalItems;

  PaginationEntity({
    required this.totalItems,
  });
}

abstract class RecommendedFoodEntity {
  final String? id;
  final String? foodItemName;
  final double? matchPercentage;
  final double? givenPercentage;
  final String? restaurantName;
  final String? addressDistanceFromMyLocation;

  RecommendedFoodEntity({
    required this.id,
    required this.foodItemName,
    required this.matchPercentage,
    required this.givenPercentage,
    required this.restaurantName,
    required this.addressDistanceFromMyLocation,
  });
}

abstract class RecommendationEntity {
  final PaginationEntity? pagination;
  final List<RecommendedFoodEntity>? recommendedFoods;

  RecommendationEntity({
    required this.pagination,
    required this.recommendedFoods,
  });
}
