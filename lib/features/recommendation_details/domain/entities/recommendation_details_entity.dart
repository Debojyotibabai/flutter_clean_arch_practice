abstract class RecommendationDetailsEntity {
  final String? restaurantId;
  final List<dynamic>? images;
  final String? restaurantName;
  final String? phoneCountryCode;
  final String? phoneNumber;
  final String? streetAddress;
  final String? country;
  final String? state;
  final String? city;

  RecommendationDetailsEntity({
    required this.restaurantId,
    required this.images,
    required this.restaurantName,
    required this.phoneCountryCode,
    required this.phoneNumber,
    required this.streetAddress,
    required this.country,
    required this.state,
    required this.city,
  });
}
