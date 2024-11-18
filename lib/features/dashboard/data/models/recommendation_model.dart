import 'dart:convert';

import 'package:clean_architecture_rivaan_ranawat/features/dashboard/domain/entities/recommendation_entity.dart';

List<RecommendationModel> recommendationModelFromJson(String str) =>
    List<RecommendationModel>.from(
        json.decode(str).map((x) => RecommendationModel.fromJson(x)));

String recommendationModelToJson(List<RecommendationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RecommendationModel extends RecommendationEntity {
  Restaurant? restaurant;
  FoodCategory? foodCategory;
  dynamic foodItemImageUrl;
  String? description;
  bool? isFeatured;
  List<Tag>? tags;
  ExtraAttributes? extraAttributes;
  List<dynamic>? deals;
  double? givenRating;

  RecommendationModel({
    required super.id,
    required super.foodItemName,
    required super.price,
    required super.restaurantName,
    required super.addressDistanceFromMyLocation,
    super.matchPercentage,
    super.givenPercentage,
    this.restaurant,
    this.foodCategory,
    this.foodItemImageUrl,
    this.description,
    this.isFeatured,
    this.tags,
    this.extraAttributes,
    this.deals,
    this.givenRating,
  });

  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(
        id: json["id"]?.toString() ?? "",
        foodItemName: json["foodItemName"] ?? "",
        price: json["price"].toDouble(),
        matchPercentage: json["matchPercentage"]?.toDouble() ?? 0.0,
        givenPercentage: json["givenPercentage"]?.toDouble(),
        restaurantName: json["restaurant"]?["restaurantName"] ?? "",
        addressDistanceFromMyLocation: json["restaurant"]?["nearestLocation"]
                    ?["addressDistanceFromMyLocation"]
                ?.toString() ??
            "0",
        restaurant: json["restaurant"] == null
            ? null
            : Restaurant.fromJson(json["restaurant"]),
        foodCategory: json["foodCategory"] == null
            ? null
            : FoodCategory.fromJson(json["foodCategory"]),
        foodItemImageUrl: json["FoodItemImageUrl"],
        description: json["description"],
        isFeatured: json["isFeatured"],
        tags: json["tags"] is List
            ? List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x)))
            : [],
        extraAttributes: json["extraAttributes"] == null
            ? null
            : ExtraAttributes.fromJson(json["extraAttributes"]),
        deals: json["deals"] is List
            ? List<dynamic>.from(json["deals"].map((x) => x))
            : [],
        givenRating: json["givenRating"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "foodItemName": foodItemName,
        "price": price,
        "matchPercentage": matchPercentage,
        "givenPercentage": givenPercentage,
        "restaurantName": restaurantName,
        "addressDistanceFromMyLocation": addressDistanceFromMyLocation,
        "restaurant": restaurant?.toJson(),
        "foodCategory": foodCategory?.toJson(),
        "FoodItemImageUrl": foodItemImageUrl,
        "description": description,
        "isFeatured": isFeatured,
        "tags": tags == null
            ? []
            : List<dynamic>.from(tags!.map((x) => x.toJson())),
        "extraAttributes": extraAttributes?.toJson(),
        "deals": deals == null ? [] : List<dynamic>.from(deals!.map((x) => x)),
        "givenRating": givenRating,
      };
}

class ExtraAttributes {
  String? dietary;
  List<String>? mealtime;
  List<String>? flavorTypes;
  List<String>? foodConcepts;
  bool? isReprocessed;
  List<String>? foodDescription;
  List<String>? foodCategoryName;
  List<String>? foodPreparationStyles;

  ExtraAttributes({
    this.dietary,
    this.mealtime,
    this.flavorTypes,
    this.foodConcepts,
    this.isReprocessed,
    this.foodDescription,
    this.foodCategoryName,
    this.foodPreparationStyles,
  });

  factory ExtraAttributes.fromJson(Map<String, dynamic> json) =>
      ExtraAttributes(
        dietary: json["Dietary"] is String ? json["Dietary"] : "",
        mealtime: json["Mealtime"] is List
            ? List<String>.from(json["Mealtime"].map((x) => x))
            : [],
        flavorTypes: json["Flavor Types"] is List
            ? List<String>.from(json["Flavor Types"].map((x) => x))
            : [],
        foodConcepts: json["Food Concepts"] is List
            ? List<String>.from(json["Food Concepts"].map((x) => x))
            : [],
        isReprocessed: json["isReprocessed"] ?? false,
        foodDescription: json["Food Description"] is List
            ? List<String>.from(json["Food Description"].map((x) => x))
            : [],
        foodCategoryName: json["foodCategoryName"] is List
            ? List<String>.from(json["foodCategoryName"].map((x) => x))
            : [],
        foodPreparationStyles: json["Food Preparation Styles"] is List
            ? List<String>.from(json["Food Preparation Styles"].map((x) => x))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "Dietary": dietary,
        "Mealtime":
            mealtime == null ? [] : List<dynamic>.from(mealtime!.map((x) => x)),
        "Flavor Types": flavorTypes == null
            ? []
            : List<dynamic>.from(flavorTypes!.map((x) => x)),
        "Food Concepts": foodConcepts == null
            ? []
            : List<dynamic>.from(foodConcepts!.map((x) => x)),
        "isReprocessed": isReprocessed,
        "Food Description": foodDescription == null
            ? []
            : List<dynamic>.from(foodDescription!.map((x) => x)),
        "foodCategoryName": foodCategoryName == null
            ? []
            : List<dynamic>.from(foodCategoryName!.map((x) => x)),
        "Food Preparation Styles": foodPreparationStyles == null
            ? []
            : List<dynamic>.from(foodPreparationStyles!.map((x) => x)),
      };
}

class FoodCategory {
  String? categoryId;
  String? categoryName;

  FoodCategory({
    this.categoryId,
    this.categoryName,
  });

  factory FoodCategory.fromJson(Map<String, dynamic> json) => FoodCategory(
        categoryId: json["categoryId"]?.toString(),
        categoryName: json["categoryName"],
      );

  Map<String, dynamic> toJson() => {
        "categoryId": categoryId,
        "categoryName": categoryName,
      };
}

class Restaurant {
  String? restaurantId;
  String? restaurantName;
  NearestLocation? nearestLocation;

  Restaurant({
    this.restaurantId,
    this.restaurantName,
    this.nearestLocation,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        restaurantId: json["restaurantId"]?.toString(),
        restaurantName: json["restaurantName"],
        nearestLocation: json["nearestLocation"] == null
            ? null
            : NearestLocation.fromJson(json["nearestLocation"]),
      );

  Map<String, dynamic> toJson() => {
        "restaurantId": restaurantId,
        "restaurantName": restaurantName,
        "nearestLocation": nearestLocation?.toJson(),
      };
}

class NearestLocation {
  String? addressId;
  String? addressDistanceFromMyLocation;
  String? addressDistanceFromMyLocationUnit;

  NearestLocation({
    this.addressId,
    this.addressDistanceFromMyLocation,
    this.addressDistanceFromMyLocationUnit,
  });

  factory NearestLocation.fromJson(Map<String, dynamic> json) =>
      NearestLocation(
        addressId: json["addressId"]?.toString(),
        addressDistanceFromMyLocation:
            json["addressDistanceFromMyLocation"]?.toString(),
        addressDistanceFromMyLocationUnit:
            json["addressDistanceFromMyLocationUnit"],
      );

  Map<String, dynamic> toJson() => {
        "addressId": addressId,
        "addressDistanceFromMyLocation": addressDistanceFromMyLocation,
        "addressDistanceFromMyLocationUnit": addressDistanceFromMyLocationUnit,
      };
}

class Tag {
  String? tagId;
  String? tagName;

  Tag({
    this.tagId,
    this.tagName,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        tagId: json["tagId"]?.toString(),
        tagName: json["tagName"],
      );

  Map<String, dynamic> toJson() => {
        "tagId": tagId,
        "tagName": tagName,
      };
}
