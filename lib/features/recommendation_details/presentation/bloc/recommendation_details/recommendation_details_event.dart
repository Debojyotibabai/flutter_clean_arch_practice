part of 'recommendation_details_bloc.dart';

@immutable
sealed class RecommendationDetailsEvent {}

final class GetRecommendationDetailsEvent extends RecommendationDetailsEvent {
  final String restaurantId;

  GetRecommendationDetailsEvent({
    required this.restaurantId,
  });
}
