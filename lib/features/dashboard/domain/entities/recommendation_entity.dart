abstract class PaginationEntity {
  final int? totalItems;

  PaginationEntity({
    required this.totalItems,
  });
}

class RecommendedFoodEntity {
  final String? id;
  final String? foodItemName;
  final double? matchPercentage;
  final double? givenPercentage;
  final String? restaurantName;
  final String? addressDistanceFromMyLocation;

  final bool? isReportFoodOptionVisible;

  RecommendedFoodEntity({
    required this.id,
    required this.foodItemName,
    required this.matchPercentage,
    required this.givenPercentage,
    required this.restaurantName,
    required this.addressDistanceFromMyLocation,
    this.isReportFoodOptionVisible = false,
  });
}

class RecommendationEntity {
  final PaginationEntity? pagination;
  final List<RecommendedFoodEntity>? recommendedFoods;

  RecommendationEntity({
    required this.pagination,
    required this.recommendedFoods,
  });

  RecommendationEntity copyWith({
    PaginationEntity? pagination,
    List<RecommendedFoodEntity>? recommendedFoods,
  }) {
    return RecommendationEntity(
      pagination: pagination ?? this.pagination,
      recommendedFoods: recommendedFoods ?? this.recommendedFoods,
    );
  }
}
