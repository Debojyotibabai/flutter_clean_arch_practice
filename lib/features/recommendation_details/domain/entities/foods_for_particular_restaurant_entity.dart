class PaginationEntity {
  final int? totalItems;

  PaginationEntity({
    required this.totalItems,
  });
}

abstract class FoodEntity {
  final String? id;
  final String? foodItemName;
  final double? price;
  final double? matchPercentage;
  final dynamic givenPercentage;

  FoodEntity({
    required this.id,
    required this.foodItemName,
    required this.price,
    required this.matchPercentage,
    required this.givenPercentage,
  });
}

class FoodsForParticularRestaurantEntity {
  final PaginationEntity? pagination;
  final List<FoodEntity>? foods;

  FoodsForParticularRestaurantEntity({
    required this.pagination,
    required this.foods,
  });
}
