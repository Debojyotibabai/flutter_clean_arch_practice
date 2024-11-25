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

  RecommendedFoodEntity copyWith({
    String? id,
    String? foodItemName,
    double? matchPercentage,
    double? givenPercentage,
    String? restaurantName,
    String? addressDistanceFromMyLocation,
    bool? isReportFoodOptionVisible,
  }) {
    return RecommendedFoodEntity(
      id: id ?? this.id,
      foodItemName: foodItemName ?? this.foodItemName,
      matchPercentage: matchPercentage ?? this.matchPercentage,
      givenPercentage: givenPercentage ?? this.givenPercentage,
      restaurantName: restaurantName ?? this.restaurantName,
      addressDistanceFromMyLocation:
          addressDistanceFromMyLocation ?? this.addressDistanceFromMyLocation,
      isReportFoodOptionVisible:
          isReportFoodOptionVisible ?? this.isReportFoodOptionVisible,
    );
  }
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
