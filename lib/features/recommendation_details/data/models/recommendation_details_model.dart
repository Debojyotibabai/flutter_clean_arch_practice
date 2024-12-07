// To parse this JSON data, do
//
//     final recommendationDetailsModel = recommendationDetailsModelFromMap(jsonString);

import 'dart:convert';

RecommendationDetailsModel recommendationDetailsModelFromMap(String str) =>
    RecommendationDetailsModel.fromMap(json.decode(str));

String recommendationDetailsModelToMap(RecommendationDetailsModel data) =>
    json.encode(data.toMap());

class RecommendationDetailsModel {
  final String? restaurantId;
  final String? restaurantName;
  final List<dynamic>? companyWideImages;
  final RestaurantLocationDetails? restaurantLocationDetails;

  RecommendationDetailsModel({
    this.restaurantId,
    this.restaurantName,
    this.companyWideImages,
    this.restaurantLocationDetails,
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
            : RestaurantLocationDetails.fromMap(
                json["restaurantLocationDetails"]),
      );

  Map<String, dynamic> toMap() => {
        "restaurantId": restaurantId,
        "restaurantName": restaurantName,
        "companyWideImages": companyWideImages == null
            ? []
            : List<dynamic>.from(companyWideImages!.map((x) => x)),
        "restaurantLocationDetails": restaurantLocationDetails?.toMap(),
      };
}

class RestaurantLocationDetails {
  final String? addressId;
  final String? streetAddress;
  final String? country;
  final String? state;
  final String? city;
  final String? zipCode;
  final String? latitude;
  final String? longitude;
  final String? phoneCountryCode;
  final String? phoneNumber;
  final DateTime? addedOn;
  final List<dynamic>? locationSpecificImages;
  final List<Food>? foods;

  RestaurantLocationDetails({
    this.addressId,
    this.streetAddress,
    this.country,
    this.state,
    this.city,
    this.zipCode,
    this.latitude,
    this.longitude,
    this.phoneCountryCode,
    this.phoneNumber,
    this.addedOn,
    this.locationSpecificImages,
    this.foods,
  });

  factory RestaurantLocationDetails.fromMap(Map<String, dynamic> json) =>
      RestaurantLocationDetails(
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

  Map<String, dynamic> toMap() => {
        "addressId": addressId,
        "streetAddress": streetAddress,
        "country": country,
        "state": state,
        "city": city,
        "zipCode": zipCode,
        "latitude": latitude,
        "longitude": longitude,
        "phoneCountryCode": phoneCountryCode,
        "phoneNumber": phoneNumber,
        "addedOn": addedOn?.toIso8601String(),
        "locationSpecificImages": locationSpecificImages == null
            ? []
            : List<dynamic>.from(locationSpecificImages!.map((x) => x)),
        "foods": foods == null
            ? []
            : List<dynamic>.from(foods!.map((x) => x.toMap())),
      };
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

  Map<String, dynamic> toMap() => {
        "id": id,
        "restaurant": restaurant?.toMap(),
        "foodCategory": foodCategory?.toMap(),
        "FoodItemImageUrl": foodItemImageUrl,
        "foodItemName": foodItemName,
        "description": description,
        "price": price,
        "isFeatured": isFeatured,
        "tags":
            tags == null ? [] : List<dynamic>.from(tags!.map((x) => x.toMap())),
        "extraAttributes": extraAttributes?.toMap(),
        "deals": deals == null ? [] : List<dynamic>.from(deals!.map((x) => x)),
        "matchPercentage": matchPercentage,
        "givenRating": givenRating,
        "givenPercentage": givenPercentage,
      };
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

  Map<String, dynamic> toMap() => {
        "Dietary":
            dietary == null ? [] : List<dynamic>.from(dietary!.map((x) => x)),
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

  Map<String, dynamic> toMap() => {
        "categoryId": categoryId,
        "categoryName": categoryName,
      };
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

  Map<String, dynamic> toMap() => {
        "restaurantId": restaurantId,
        "restaurantName": restaurantName,
        "nearestLocation": nearestLocation?.toMap(),
      };
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

  Map<String, dynamic> toMap() => {
        "addressId": addressId,
        "addressDistanceFromMyLocation": addressDistanceFromMyLocation,
        "addressDistanceFromMyLocationUnit": addressDistanceFromMyLocationUnit,
      };
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

  Map<String, dynamic> toMap() => {
        "tagId": tagId,
        "tagName": tagName,
      };
}
