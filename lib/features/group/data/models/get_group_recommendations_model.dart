// To parse this JSON data, do
//
//     final getGroupRecommendationsModel = getGroupRecommendationsModelFromMap(jsonString);

import 'dart:convert';

import 'package:clean_architecture_rivaan_ranawat/features/group/domain/entities/get_group_recommendations_entity.dart';

GetGroupRecommendationsModel getGroupRecommendationsModelFromMap(String str) =>
    GetGroupRecommendationsModel.fromMap(json.decode(str));

class GetGroupRecommendationsModel extends GetGroupRecommendationsEntity {
  GetGroupRecommendationsModel({
    super.message,
    super.pagination,
    super.restaurantRecommendations,
  });

  factory GetGroupRecommendationsModel.fromMap(Map<String, dynamic> json) =>
      GetGroupRecommendationsModel(
        message: json["message"] ?? "",
        pagination: json["pagination"] == null
            ? null
            : PaginationModel.fromMap(json["pagination"]),
        restaurantRecommendations: json["restaurant_recommendations"] == null
            ? []
            : List<RestaurantRecommendationModel>.from(
                json["restaurant_recommendations"]!
                    .map((x) => RestaurantRecommendationModel.fromMap(x))),
      );
}

class PaginationModel extends PaginationEntity {
  PaginationModel({
    super.totalItems,
    super.perPage,
    super.currentPage,
    super.lastPage,
  });

  factory PaginationModel.fromMap(Map<String, dynamic> json) => PaginationModel(
        totalItems: json["totalItems"],
        perPage: json["perPage"],
        currentPage: json["currentPage"],
        lastPage: json["lastPage"],
      );
}

class RestaurantRecommendationModel extends RestaurantRecommendationEntity {
  RestaurantRecommendationModel({
    super.restaurantId,
    super.restaurantName,
    super.averagePercentage,
    super.averageRating,
    super.nearestRestaurantAddress,
    super.index,
  });

  factory RestaurantRecommendationModel.fromMap(Map<String, dynamic> json) =>
      RestaurantRecommendationModel(
        restaurantId: json["restaurantId"],
        restaurantName: json["restaurantName"],
        averagePercentage: json["averagePercentage"]?.toDouble(),
        averageRating: json["averageRating"]?.toDouble(),
        nearestRestaurantAddress: json["nearestRestaurantAddress"] == null
            ? null
            : NearestRestaurantAddressModel.fromMap(
                json["nearestRestaurantAddress"]),
        index: json["index"],
      );
}

class NearestRestaurantAddressModel extends NearestRestaurantAddressEntity {
  NearestRestaurantAddressModel({
    super.nearestRestaurantAddressId,
    super.latitude,
    super.longitude,
    super.nearestRestaurantAddressDistance,
    super.nearestRestaurantAddressDistanceUnit,
  });

  factory NearestRestaurantAddressModel.fromMap(Map<String, dynamic> json) =>
      NearestRestaurantAddressModel(
        nearestRestaurantAddressId: json["nearestRestaurantAddressId"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        nearestRestaurantAddressDistance:
            json["nearestRestaurantAddressDistance"]?.toDouble(),
        nearestRestaurantAddressDistanceUnit:
            json["nearestRestaurantAddressDistanceUnit"],
      );
}
