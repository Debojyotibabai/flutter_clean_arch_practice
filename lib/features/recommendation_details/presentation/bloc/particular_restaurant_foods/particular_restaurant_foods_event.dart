part of 'particular_restaurant_foods_bloc.dart';

@immutable
sealed class ParticularRestaurantFoodsEvent {}

final class GetAllFoodsForParticularRestaurantEvent
    extends ParticularRestaurantFoodsEvent {
  final String restaurantId;
  final int page;
  final int size;

  GetAllFoodsForParticularRestaurantEvent({
    required this.restaurantId,
    required this.page,
    required this.size,
  });
}
