// To parse this JSON data, do
//
//     final recommendationDetailsModel = recommendationDetailsModelFromMap(jsonString);

import 'dart:convert';

import 'package:clean_architecture_rivaan_ranawat/features/recommendation_details/domain/entities/recommendation_details_entity.dart';

RecommendationDetailsModel recommendationDetailsModelFromMap(String str) =>
    RecommendationDetailsModel.fromMap(json.decode(str));

class RecommendationDetailsModel extends RecommendationDetailsEntity {
  RecommendationDetailsModel({
    required super.restaurantId,
    required super.restaurantName,
    required super.companyWideImages,
    required super.restaurantLocationDetails,
  });

  factory RecommendationDetailsModel.fromMap(Map<String, dynamic> json) =>
      RecommendationDetailsModel(
        restaurantId: json["restaurantId"],
        restaurantName: json["restaurantName"],
        companyWideImages: json["companyWideImages"] == null
            ? []
            : List<dynamic>.from(json["companyWideImages"]!.map((x) => x)),
        restaurantLocationDetails: json["restaurantLocationDetails"] == null
            ? null
            : RestaurantLocationDetailsModel.fromMap(
                json["restaurantLocationDetails"]),
      );
}

class RestaurantLocationDetailsModel extends RestaurantLocationDetailsEntity {
  final String? addressId;
  final String? zipCode;
  final String? latitude;
  final String? longitude;
  final DateTime? addedOn;
  final List<Food>? foods;

  RestaurantLocationDetailsModel({
    this.addressId,
    this.zipCode,
    this.latitude,
    this.longitude,
    this.addedOn,
    this.foods,
    required super.streetAddress,
    required super.country,
    required super.state,
    required super.city,
    required super.phoneCountryCode,
    required super.phoneNumber,
    required super.locationSpecificImages,
  });

  factory RestaurantLocationDetailsModel.fromMap(Map<String, dynamic> json) =>
      RestaurantLocationDetailsModel(
        addressId: json["addressId"],
        streetAddress: json["streetAddress"],
        country: json["country"],
        state: json["state"],
        city: json["city"],
        zipCode: json["zipCode"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        phoneCountryCode: json["phoneCountryCode"],
        phoneNumber: json["phoneNumber"],
        addedOn:
            json["addedOn"] == null ? null : DateTime.parse(json["addedOn"]),
        locationSpecificImages: json["locationSpecificImages"] == null
            ? []
            : List<dynamic>.from(json["locationSpecificImages"]!.map((x) => x)),
        foods: json["foods"] == null
            ? []
            : List<Food>.from(json["foods"]!.map((x) => Food.fromMap(x))),
      );
}

class Food {
  final String? id;
  final Restaurant? restaurant;
  final FoodCategory? foodCategory;
  final dynamic foodItemImageUrl;
  final String? foodItemName;
  final String? description;
  final double? price;
  final bool? isFeatured;
  final List<Tag>? tags;
  final ExtraAttributes? extraAttributes;
  final List<dynamic>? deals;
  final double? matchPercentage;
  final dynamic givenRating;
  final dynamic givenPercentage;

  Food({
    this.id,
    this.restaurant,
    this.foodCategory,
    this.foodItemImageUrl,
    this.foodItemName,
    this.description,
    this.price,
    this.isFeatured,
    this.tags,
    this.extraAttributes,
    this.deals,
    this.matchPercentage,
    this.givenRating,
    this.givenPercentage,
  });

  factory Food.fromMap(Map<String, dynamic> json) => Food(
        id: json["id"],
        restaurant: json["restaurant"] == null
            ? null
            : Restaurant.fromMap(json["restaurant"]),
        foodCategory: json["foodCategory"] == null
            ? null
            : FoodCategory.fromMap(json["foodCategory"]),
        foodItemImageUrl: json["FoodItemImageUrl"],
        foodItemName: json["foodItemName"],
        description: json["description"],
        price: json["price"]?.toDouble(),
        isFeatured: json["isFeatured"],
        tags: json["tags"] == null
            ? []
            : List<Tag>.from(json["tags"]!.map((x) => Tag.fromMap(x))),
        extraAttributes: json["extraAttributes"] == null
            ? null
            : ExtraAttributes.fromMap(json["extraAttributes"]),
        deals: json["deals"] == null
            ? []
            : List<dynamic>.from(json["deals"]!.map((x) => x)),
        matchPercentage: json["matchPercentage"]?.toDouble(),
        givenRating: json["givenRating"],
        givenPercentage: json["givenPercentage"],
      );
}

class ExtraAttributes {
  final List<String>? dietary;
  final List<String>? mealtime;
  final List<String>? flavorTypes;
  final List<String>? foodConcepts;
  final bool? isReprocessed;
  final List<String>? foodDescription;
  final List<String>? foodCategoryName;
  final List<String>? foodPreparationStyles;

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

  factory ExtraAttributes.fromMap(Map<String, dynamic> json) => ExtraAttributes(
        dietary: json["Dietary"] == null
            ? []
            : List<String>.from(json["Dietary"]!.map((x) => x)),
        mealtime: json["Mealtime"] == null
            ? []
            : List<String>.from(json["Mealtime"]!.map((x) => x)),
        flavorTypes: json["Flavor Types"] == null
            ? []
            : List<String>.from(json["Flavor Types"]!.map((x) => x)),
        foodConcepts: json["Food Concepts"] == null
            ? []
            : List<String>.from(json["Food Concepts"]!.map((x) => x)),
        isReprocessed: json["isReprocessed"],
        foodDescription: json["Food Description"] == null
            ? []
            : List<String>.from(json["Food Description"]!.map((x) => x)),
        foodCategoryName: json["foodCategoryName"] == null
            ? []
            : List<String>.from(json["foodCategoryName"]!.map((x) => x)),
        foodPreparationStyles: json["Food Preparation Styles"] == null
            ? []
            : List<String>.from(json["Food Preparation Styles"]!.map((x) => x)),
      );
}

class FoodCategory {
  final String? categoryId;
  final String? categoryName;

  FoodCategory({
    this.categoryId,
    this.categoryName,
  });

  factory FoodCategory.fromMap(Map<String, dynamic> json) => FoodCategory(
        categoryId: json["categoryId"],
        categoryName: json["categoryName"],
      );
}

class Restaurant {
  final String? restaurantId;
  final String? restaurantName;
  final NearestLocation? nearestLocation;

  Restaurant({
    this.restaurantId,
    this.restaurantName,
    this.nearestLocation,
  });

  factory Restaurant.fromMap(Map<String, dynamic> json) => Restaurant(
        restaurantId: json["restaurantId"],
        restaurantName: json["restaurantName"],
        nearestLocation: json["nearestLocation"] == null
            ? null
            : NearestLocation.fromMap(json["nearestLocation"]),
      );
}

class NearestLocation {
  final dynamic addressId;
  final dynamic addressDistanceFromMyLocation;
  final dynamic addressDistanceFromMyLocationUnit;

  NearestLocation({
    this.addressId,
    this.addressDistanceFromMyLocation,
    this.addressDistanceFromMyLocationUnit,
  });

  factory NearestLocation.fromMap(Map<String, dynamic> json) => NearestLocation(
        addressId: json["addressId"],
        addressDistanceFromMyLocation: json["addressDistanceFromMyLocation"],
        addressDistanceFromMyLocationUnit:
            json["addressDistanceFromMyLocationUnit"],
      );
}

class Tag {
  final String? tagId;
  final String? tagName;

  Tag({
    this.tagId,
    this.tagName,
  });

  factory Tag.fromMap(Map<String, dynamic> json) => Tag(
        tagId: json["tagId"],
        tagName: json["tagName"],
      );
}
