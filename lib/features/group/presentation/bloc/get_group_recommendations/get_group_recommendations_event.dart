part of 'get_group_recommendations_bloc.dart';

sealed class GetGroupRecommendationsEvent {}

final class GetGroupRecommendations extends GetGroupRecommendationsEvent {
  final GetGroupRecommendationsParams params;

  GetGroupRecommendations({required this.params});
}

final class AttachFoodToRecommendations extends GetGroupRecommendationsEvent {
  final GetFoodAsPerRestaurantsEntity recommendations;

  AttachFoodToRecommendations({
    required this.recommendations,
  });
}
