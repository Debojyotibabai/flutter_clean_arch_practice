abstract class FoodEntity {
  final String? id;
  final String? foodItemName;
  final double? price;
  final double? matchPercentage;
  final dynamic givenPercentage;

  FoodEntity({
    required this.id,
    required this.foodItemName,
    required this.price,
    required this.matchPercentage,
    required this.givenPercentage,
  });
}

abstract class RestaurantLocationDetailsEntity {
  final List<dynamic>? locationSpecificImages;
  final String? phoneCountryCode;
  final String? phoneNumber;
  final String? streetAddress;
  final String? country;
  final String? state;
  final String? city;
  final List<FoodEntity>? foods;

  RestaurantLocationDetailsEntity({
    required this.locationSpecificImages,
    required this.phoneCountryCode,
    required this.phoneNumber,
    required this.streetAddress,
    required this.country,
    required this.state,
    required this.city,
    required this.foods,
  });
}

abstract class RecommendationDetailsEntity {
  final String? restaurantId;
  final String? restaurantName;
  final List<dynamic>? companyWideImages;
  final RestaurantLocationDetailsEntity? restaurantLocationDetails;

  RecommendationDetailsEntity({
    required this.restaurantId,
    required this.restaurantName,
    required this.companyWideImages,
    required this.restaurantLocationDetails,
  });
}
