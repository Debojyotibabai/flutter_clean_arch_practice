abstract class PaginationEntity {
  final int? totalItems;
  final int? perPage;
  final int? currentPage;
  final int? lastPage;

  PaginationEntity({
    this.totalItems,
    this.perPage,
    this.currentPage,
    this.lastPage,
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
    this.matchPercentage,
    this.givenPercentage,
    required this.restaurantName,
    required this.addressDistanceFromMyLocation,
  });
}

abstract class RecommendationEntity {
  final PaginationEntity pagination;
  final List<RecommendedFoodEntity> recommendedFoods;

  RecommendationEntity({
    required this.pagination,
    required this.recommendedFoods,
  });
}
