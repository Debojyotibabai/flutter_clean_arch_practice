part of 'get_food_as_per_restaurants_bloc.dart';

sealed class GetFoodAsPerRestaurantsState {}

final class GetFoodAsPerRestaurantsInitial
    extends GetFoodAsPerRestaurantsState {}

final class GetFoodAsPerRestaurantsLoading
    extends GetFoodAsPerRestaurantsState {}

final class GetFoodAsPerRestaurantsSuccess
    extends GetFoodAsPerRestaurantsState {
  final GetFoodAsPerRestaurantsEntity recommendations;

  GetFoodAsPerRestaurantsSuccess({
    required this.recommendations,
  });
}

final class GetFoodAsPerRestaurantsError extends GetFoodAsPerRestaurantsState {
  final String message;

  GetFoodAsPerRestaurantsError({
    required this.message,
  });
}
