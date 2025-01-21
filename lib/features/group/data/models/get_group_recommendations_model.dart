// To parse this JSON data, do
//
//     final getGroupDetailsModel = getGroupDetailsModelFromMap(jsonString);

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
            : List<dynamic>.from(
                json["restaurant_recommendations"]!.map((x) => x)),
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
