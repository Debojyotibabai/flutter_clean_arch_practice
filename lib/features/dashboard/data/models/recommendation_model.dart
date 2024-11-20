import 'package:clean_architecture_rivaan_ranawat/features/dashboard/domain/entities/recommendation_entity.dart';

class RecommendationModel extends RecommendationEntity {
  RecommendationModel({
    required super.pagination,
    required super.recommendedFoods,
  });

  factory RecommendationModel.fromMap(Map<String, dynamic> json) =>
      RecommendationModel(
        pagination: PaginationModel.fromMap(json["pagination"]),
        recommendedFoods: List<RecommendedFood>.from(
          json["recommendedFoods"].map((x) => RecommendedFood.fromMap(x)),
        ),
      );

  Map<String, dynamic> toMap() => {
        "pagination": (pagination as PaginationModel).toMap(),
        "recommendedFoods": recommendedFoods
            .map((x) => (x as RecommendedFood).toMap())
            .toList(),
      };
}

class PaginationModel extends PaginationEntity {
  PaginationModel({
    required super.totalItems,
    required super.perPage,
    required super.currentPage,
    required super.lastPage,
  });

  factory PaginationModel.fromMap(Map<String, dynamic> json) => PaginationModel(
        totalItems: json["totalItems"],
        perPage: json["perPage"],
        currentPage: json["currentPage"],
        lastPage: json["lastPage"],
      );

  Map<String, dynamic> toMap() => {
        "totalItems": totalItems,
        "perPage": perPage,
        "currentPage": currentPage,
        "lastPage": lastPage,
      };
}

class RecommendedFood extends RecommendedFoodEntity {
  final Restaurant? restaurant;
  final FoodCategory? foodCategory;
  final dynamic foodItemImageUrl;
  final String? description;
  final double? price;
  final bool? isFeatured;
  final List<Tag>? tags;
  final ExtraAttributes? extraAttributes;
  final List<dynamic>? deals;
  final double? givenRating;

  RecommendedFood({
    this.restaurant,
    this.foodCategory,
    this.foodItemImageUrl,
    this.description,
    this.price,
    this.isFeatured,
    this.tags,
    this.extraAttributes,
    this.deals,
    this.givenRating,
    required super.id,
    required super.foodItemName,
    required super.addressDistanceFromMyLocation,
    required super.restaurantName,
    super.matchPercentage,
    super.givenPercentage,
  });

  factory RecommendedFood.fromMap(Map<String, dynamic> json) => RecommendedFood(
        id: json["id"],
        foodItemName: json["foodItemName"],
        matchPercentage: json["matchPercentage"],
        givenPercentage: json["givenPercentage"],
        restaurantName: json["restaurant"]?["restaurantName"] ?? "",
        addressDistanceFromMyLocation: json["restaurant"]?["nearestLocation"]
                    ?["addressDistanceFromMyLocation"]
                ?.toString() ??
            "0",
        restaurant: json["restaurant"] == null
            ? null
            : Restaurant.fromMap(json["restaurant"]),
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

  Map<String, dynamic> toMap() => {
        "id": id,
        "foodItemName": foodItemName,
        "matchPercentage": matchPercentage,
        "givenPercentage": givenPercentage,
        "restaurantName": restaurantName,
        "addressDistanceFromMyLocation": addressDistanceFromMyLocation,
        "restaurant": restaurant?.toMap(),
        "foodCategory": foodCategory?.toMap(),
        "FoodItemImageUrl": foodItemImageUrl,
        "description": description,
        "price": price,
        "isFeatured": isFeatured,
        "tags": tags?.map((x) => x.toMap()).toList(),
        "extraAttributes": extraAttributes?.toMap(),
        "deals": deals,
        "givenRating": givenRating,
      };
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
        dietary: json["Dietary"],
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
        "Dietary": dietary,
        "Mealtime": mealtime,
        "Flavor Types": flavorTypes,
        "Food Concepts": foodConcepts,
        "isReprocessed": isReprocessed,
        "Food Description": foodDescription,
        "foodCategoryName": foodCategoryName,
        "Food Preparation Styles": foodPreparationStyles,
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
