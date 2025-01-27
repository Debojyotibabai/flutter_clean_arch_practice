part of 'get_food_as_per_restaurants_bloc.dart';

sealed class GetFoodAsPerRestaurantsEvent {}

final class GetFoodAsPerRestaurants extends GetFoodAsPerRestaurantsEvent {
  final List<String> restaurantIds;

  GetFoodAsPerRestaurants({required this.restaurantIds});
}
