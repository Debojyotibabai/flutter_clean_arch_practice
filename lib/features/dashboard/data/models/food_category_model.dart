import 'dart:convert';

import 'package:clean_architecture_rivaan_ranawat/features/dashboard/domain/entities/food_category_entity.dart';

class FoodCategoryModel extends FoodCategoryEntity {
  final String? description;

  FoodCategoryModel({
    required super.restaurantCategoryId,
    required super.restaurantCategoryName,
    this.description,
  });

  factory FoodCategoryModel.fromJson(Map<String, dynamic> json) =>
      FoodCategoryModel(
        restaurantCategoryId: json["restaurantCategoryId"],
        restaurantCategoryName: json["restaurantCategoryName"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "restaurantCategoryId": restaurantCategoryId,
        "restaurantCategoryName": restaurantCategoryName,
        "description": description,
      };
}

List<FoodCategoryModel> foodCategoryModelFromJson(String str) =>
    List<FoodCategoryModel>.from(
        json.decode(str).map((x) => FoodCategoryModel.fromJson(x)));

String foodCategoryModelToJson(List<FoodCategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
