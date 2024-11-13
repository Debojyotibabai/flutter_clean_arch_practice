part of 'food_category_bloc.dart';

@immutable
sealed class FoodCategoryState {}

class GetFoodCategoryInitial extends FoodCategoryState {}

class GetFoodCategoryLoading extends FoodCategoryState {}

class GetFoodCategorySuccess extends FoodCategoryState {
  final List<FoodCategoryEntity> foodCategory;

  GetFoodCategorySuccess({required this.foodCategory});
}

class GetFoodCategoryError extends FoodCategoryState {
  final String error;

  GetFoodCategoryError({required this.error});
}
