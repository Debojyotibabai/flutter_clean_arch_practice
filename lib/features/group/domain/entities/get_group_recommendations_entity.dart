import 'package:clean_architecture_rivaan_ranawat/features/group/domain/entities/get_food_as_per_restaurants_entity.dart';

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
  final RecommendationEntity? recommendation;

  RestaurantRecommendationEntity({
    this.restaurantId,
    this.restaurantName,
    this.averagePercentage,
    this.averageRating,
    this.nearestRestaurantAddress,
    this.index,
    this.recommendation,
  });

  RestaurantRecommendationEntity copyWith({
    String? restaurantId,
    String? restaurantName,
    double? averagePercentage,
    double? averageRating,
    NearestRestaurantAddressEntity? nearestRestaurantAddress,
    int? index,
    RecommendationEntity? recommendation,
  }) =>
      RestaurantRecommendationEntity(
        restaurantId: restaurantId ?? this.restaurantId,
        restaurantName: restaurantName ?? this.restaurantName,
        averagePercentage: averagePercentage ?? this.averagePercentage,
        averageRating: averageRating ?? this.averageRating,
        nearestRestaurantAddress:
            nearestRestaurantAddress ?? this.nearestRestaurantAddress,
        index: index ?? this.index,
        recommendation: recommendation ?? this.recommendation,
      );
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

  GetGroupRecommendationsEntity copyWith({
    String? message,
    PaginationEntity? pagination,
    List<RestaurantRecommendationEntity>? restaurantRecommendations,
  }) =>
      GetGroupRecommendationsEntity(
        message: message ?? this.message,
        pagination: pagination ?? this.pagination,
        restaurantRecommendations:
            restaurantRecommendations ?? this.restaurantRecommendations,
      );
}
