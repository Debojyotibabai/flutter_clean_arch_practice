class PaginationEntity {
  final int? totalItems;

  PaginationEntity({
    required this.totalItems,
  });

  PaginationEntity copyWith({
    int? totalItems,
  }) {
    return PaginationEntity(
      totalItems: totalItems ?? this.totalItems,
    );
  }
}

class RestaurantEntity {
  final String? restaurantId;

  RestaurantEntity({
    required this.restaurantId,
  });
}

class RecommendedFoodEntity {
  final String? id;
  final RestaurantEntity? restaurant;
  final String? foodItemName;
  final double? matchPercentage;
  final double? givenPercentage;
  final String? restaurantName;
  final String? addressDistanceFromMyLocation;
  final bool? isReportFoodOptionVisible;
  final List<dynamic>? deals;
  final String? nearestLocationRestaurantAddressId;

  RecommendedFoodEntity({
    required this.id,
    required this.restaurant,
    required this.foodItemName,
    required this.matchPercentage,
    required this.givenPercentage,
    required this.restaurantName,
    required this.addressDistanceFromMyLocation,
    this.isReportFoodOptionVisible = false,
    required this.deals,
    required this.nearestLocationRestaurantAddressId,
  });

  RecommendedFoodEntity copyWith({
    String? id,
    RestaurantEntity? restaurant,
    String? foodItemName,
    double? matchPercentage,
    double? givenPercentage,
    String? restaurantName,
    String? addressDistanceFromMyLocation,
    bool? isReportFoodOptionVisible,
    List<dynamic>? deals,
    String? nearestLocationRestaurantAddressId,
  }) {
    return RecommendedFoodEntity(
      id: id ?? this.id,
      restaurant: restaurant ?? this.restaurant,
      foodItemName: foodItemName ?? this.foodItemName,
      matchPercentage: matchPercentage ?? this.matchPercentage,
      givenPercentage: givenPercentage ?? this.givenPercentage,
      restaurantName: restaurantName ?? this.restaurantName,
      addressDistanceFromMyLocation:
          addressDistanceFromMyLocation ?? this.addressDistanceFromMyLocation,
      isReportFoodOptionVisible:
          isReportFoodOptionVisible ?? this.isReportFoodOptionVisible,
      deals: deals ?? this.deals,
      nearestLocationRestaurantAddressId: nearestLocationRestaurantAddressId ??
          this.nearestLocationRestaurantAddressId,
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
