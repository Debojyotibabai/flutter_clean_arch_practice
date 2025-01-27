// To parse this JSON data, do
//
//     final getFoodAsPerRestaurantsModel = getFoodAsPerRestaurantsModelFromMap(jsonString);

import 'dart:convert';

import 'package:clean_architecture_rivaan_ranawat/features/group/domain/entities/get_food_as_per_restaurants_entity.dart';

GetFoodAsPerRestaurantsModel getFoodAsPerRestaurantsModelFromMap(String str) =>
    GetFoodAsPerRestaurantsModel.fromMap(json.decode(str));

class GetFoodAsPerRestaurantsModel extends GetFoodAsPerRestaurantsEntity {
  GetFoodAsPerRestaurantsModel({
    super.recommendations,
  });

  factory GetFoodAsPerRestaurantsModel.fromMap(Map<String, dynamic> json) =>
      GetFoodAsPerRestaurantsModel(
        recommendations: json["recommendations"] == null
            ? []
            : List<RecommendationModel>.from(json["recommendations"]!
                .map((x) => RecommendationModel.fromMap(x))),
      );
}

class RecommendationModel extends RecommendationEntity {
  RecommendationModel({
    super.restaurantId,
    super.matchPercentage,
    super.foodId,
    super.foodName,
  });

  factory RecommendationModel.fromMap(Map<String, dynamic> json) =>
      RecommendationModel(
        restaurantId: json["restaurantId"],
        matchPercentage: json["matchPercentage"]?.toDouble(),
        foodId: json["foodId"],
        foodName: json["foodName"],
      );
}
