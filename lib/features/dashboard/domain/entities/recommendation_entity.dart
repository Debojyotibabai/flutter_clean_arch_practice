abstract class RecommendationEntity {
  final String id;
  final String foodItemName;
  final double? matchPercentage;
  final double? givenPercentage;
  final String restaurantName;
  final String addressDistanceFromMyLocation;

  RecommendationEntity({
    required this.id,
    required this.foodItemName,
    this.matchPercentage,
    this.givenPercentage,
    required this.restaurantName,
    required this.addressDistanceFromMyLocation,
  });
}
