import 'package:clean_architecture_rivaan_ranawat/features/recommendation_details/domain/entities/recommendation_details_entity.dart';

class PaginationEntity {
  final int? totalItems;

  PaginationEntity({
    required this.totalItems,
  });
}

class FoodsForParticularRestaurantEntity {
  final PaginationEntity? pagination;
  final List<FoodEntity>? foods;

  FoodsForParticularRestaurantEntity({
    required this.pagination,
    required this.foods,
  });

  FoodsForParticularRestaurantEntity copyWith({
    PaginationEntity? pagination,
    List<FoodEntity>? foods,
  }) {
    return FoodsForParticularRestaurantEntity(
      pagination: pagination ?? this.pagination,
      foods: foods ?? this.foods,
    );
  }
}
