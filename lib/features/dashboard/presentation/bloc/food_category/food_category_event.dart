part of 'food_category_bloc.dart';

@immutable
sealed class FoodCategoryEvent {}

class GetFoodCategoryEvent extends FoodCategoryEvent {}
