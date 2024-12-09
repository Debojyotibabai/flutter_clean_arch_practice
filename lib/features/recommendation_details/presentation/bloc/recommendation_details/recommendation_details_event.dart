part of 'recommendation_details_bloc.dart';

@immutable
sealed class RecommendationDetailsEvent {}

final class GetRecommendationDetailsEvent extends RecommendationDetailsEvent {
  final String restaurantAddressId;

  GetRecommendationDetailsEvent({
    required this.restaurantAddressId,
  });
}
