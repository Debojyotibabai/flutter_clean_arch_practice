part of 'particular_restaurant_foods_bloc.dart';

@immutable
sealed class ParticularRestaurantFoodsState {}

final class ParticularRestaurantFoodsInitial
    extends ParticularRestaurantFoodsState {}

final class ParticularRestaurantFoodsIsLoading
    extends ParticularRestaurantFoodsState {}

final class ParticularRestaurantFoodsSuccess
    extends ParticularRestaurantFoodsState {
  final FoodsForParticularRestaurantEntity foods;

  ParticularRestaurantFoodsSuccess({required this.foods});
}

final class ParticularRestaurantFoodsError
    extends ParticularRestaurantFoodsState {
  final String message;

  ParticularRestaurantFoodsError({required this.message});
}
