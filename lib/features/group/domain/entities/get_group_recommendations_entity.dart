class NearestRestaurantAddressEntity {
  final String? nearestRestaurantAddressId;
  final String? latitude;
  final String? longitude;
  final double? nearestRestaurantAddressDistance;
  final String? nearestRestaurantAddressDistanceUnit;

  NearestRestaurantAddressEntity({
    this.nearestRestaurantAddressId,
    this.latitude,
    this.longitude,
    this.nearestRestaurantAddressDistance,
    this.nearestRestaurantAddressDistanceUnit,
  });
}

class RestaurantRecommendationEntity {
  final String? restaurantId;
  final String? restaurantName;
  final double? averagePercentage;
  final double? averageRating;
  final NearestRestaurantAddressEntity? nearestRestaurantAddress;
  final int? index;

  RestaurantRecommendationEntity({
    this.restaurantId,
    this.restaurantName,
    this.averagePercentage,
    this.averageRating,
    this.nearestRestaurantAddress,
    this.index,
  });
}

class PaginationEntity {
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

class GetGroupRecommendationsEntity {
  final String? message;
  final PaginationEntity? pagination;
  final List<RestaurantRecommendationEntity>? restaurantRecommendations;

  GetGroupRecommendationsEntity({
    this.message,
    this.pagination,
    this.restaurantRecommendations,
  });
}
