import 'package:clean_architecture_rivaan_ranawat/features/dashboard/domain/entities/recommendation_entity.dart';

class RecommendationModel extends RecommendationEntity {
  RecommendationModel({
    required super.pagination,
    required super.recommendedFoods,
  });

  factory RecommendationModel.fromMap(Map<String, dynamic> json) =>
      RecommendationModel(
        pagination: PaginationModel.fromMap(json["pagination"]),
        recommendedFoods: List<RecommendedFoodModel>.from(
          json["recommendedFoods"].map((x) => RecommendedFoodModel.fromMap(x)),
        ),
      );
}

class PaginationModel extends PaginationEntity {
  final int? perPage;
  final int? currentPage;
  final int? lastPage;

  PaginationModel({
    this.perPage,
    this.currentPage,
    this.lastPage,
    required super.totalItems,
  });

  factory PaginationModel.fromMap(Map<String, dynamic> json) => PaginationModel(
        totalItems: json["totalItems"],
        perPage: json["perPage"],
        currentPage: json["currentPage"],
        lastPage: json["lastPage"],
      );
}

class RecommendedFoodModel extends RecommendedFoodEntity {
  final FoodCategory? foodCategory;
  final dynamic foodItemImageUrl;
  final String? description;
  final double? price;
  final bool? isFeatured;
  final List<Tag>? tags;
  final ExtraAttributes? extraAttributes;
  final double? givenRating;

  RecommendedFoodModel({
    this.foodCategory,
    this.foodItemImageUrl,
    this.description,
    this.price,
    this.isFeatured,
    this.tags,
    this.extraAttributes,
    this.givenRating,
    required super.id,
    required super.restaurant,
    required super.foodItemName,
    required super.addressDistanceFromMyLocation,
    required super.restaurantName,
    required super.matchPercentage,
    required super.givenPercentage,
    required super.deals,
    required super.nearestLocationRestaurantAddressId,
  });

  factory RecommendedFoodModel.fromMap(Map<String, dynamic> json) =>
      RecommendedFoodModel(
        id: json["id"],
        foodItemName: json["foodItemName"],
        matchPercentage: json["matchPercentage"],
        givenPercentage: json["givenPercentage"],
        restaurantName: json["restaurant"]?["restaurantName"] ?? "",
        addressDistanceFromMyLocation: json["restaurant"]?["nearestLocation"]
                    ?["addressDistanceFromMyLocation"]
                ?.toString() ??
            "0",
        nearestLocationRestaurantAddressId:
            json["restaurant"]?["nearestLocation"]?["addressId"]?.toString(),
        restaurant: json["restaurant"] == null
            ? null
            : RestaurantModel.fromMap(json["restaurant"]),
        foodCategory: json["foodCategory"] == null
            ? null
            : FoodCategory.fromMap(json["foodCategory"]),
        foodItemImageUrl: json["FoodItemImageUrl"],
        description: json["description"],
        price: json["price"],
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
        givenRating: json["givenRating"],
      );
}

class ExtraAttributes {
  final String? dietary;
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
        dietary: json["Dietary"] is String
            ? json["Dietary"] as String
            : (json["Dietary"]?.toString()),
        mealtime: json["Mealtime"] is List
            ? List<String>.from(json["Mealtime"].map((x) => x.toString()))
            : [], // Handle non-list cases
        flavorTypes: json["Flavor Types"] is List
            ? List<String>.from(json["Flavor Types"].map((x) => x.toString()))
            : [], // Handle non-list cases
        foodConcepts: json["Food Concepts"] is List
            ? List<String>.from(json["Food Concepts"].map((x) => x.toString()))
            : [], // Handle non-list cases
        isReprocessed: json["isReprocessed"] ?? false,
        foodDescription: json["Food Description"] is List
            ? List<String>.from(
                json["Food Description"].map((x) => x.toString()))
            : [], // Handle non-list cases
        foodCategoryName: json["foodCategoryName"] is List
            ? List<String>.from(
                json["foodCategoryName"].map((x) => x.toString()))
            : [], // Handle non-list cases
        foodPreparationStyles: json["Food Preparation Styles"] is List
            ? List<String>.from(
                json["Food Preparation Styles"].map((x) => x.toString()))
            : [], // Handle non-list cases
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
        categoryId: json["categoryId"]?.toString(), // Safely convert to String
        categoryName:
            json["categoryName"]?.toString(), // Safely convert to String
      );
}

class RestaurantModel extends RestaurantEntity {
  final String? restaurantName;
  final NearestLocation? nearestLocation;

  RestaurantModel({
    this.restaurantName,
    this.nearestLocation,
    required super.restaurantId,
  });

  factory RestaurantModel.fromMap(Map<String, dynamic> json) => RestaurantModel(
        restaurantId: json["restaurantId"],
        restaurantName: json["restaurantName"],
        nearestLocation: json["nearestLocation"] == null
            ? null
            : NearestLocation.fromMap(json["nearestLocation"]),
      );
}

class NearestLocation {
  final String? addressId;
  final double? addressDistanceFromMyLocation;
  final String? addressDistanceFromMyLocationUnit;

  NearestLocation({
    this.addressId,
    this.addressDistanceFromMyLocation,
    this.addressDistanceFromMyLocationUnit,
  });

  factory NearestLocation.fromMap(Map<String, dynamic> json) => NearestLocation(
        addressId: json["addressId"],
        addressDistanceFromMyLocation:
            double.parse(json["addressDistanceFromMyLocation"].toString()),
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
