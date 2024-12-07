abstract class RestaurantLocationDetailsEntity {
  final List<dynamic>? locationSpecificImages;
  final String? phoneCountryCode;
  final String? phoneNumber;
  final String? streetAddress;
  final String? country;
  final String? state;
  final String? city;

  RestaurantLocationDetailsEntity({
    required this.locationSpecificImages,
    required this.phoneCountryCode,
    required this.phoneNumber,
    required this.streetAddress,
    required this.country,
    required this.state,
    required this.city,
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
