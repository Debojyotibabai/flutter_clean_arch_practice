class RecommendationEntity {
  final String? restaurantId;
  final double? matchPercentage;
  final String? foodId;
  final String? foodName;

  RecommendationEntity({
    this.restaurantId,
    this.matchPercentage,
    this.foodId,
    this.foodName,
  });
}

class GetFoodAsPerRestaurantsEntity {
  final List<RecommendationEntity>? recommendations;

  GetFoodAsPerRestaurantsEntity({
    this.recommendations,
  });
}
