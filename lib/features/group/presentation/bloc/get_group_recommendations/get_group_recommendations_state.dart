part of 'get_group_recommendations_bloc.dart';

sealed class GetGroupRecommendationsState {}

final class GetGroupRecommendationsInitial
    extends GetGroupRecommendationsState {}

final class GetGroupRecommendationsLoading
    extends GetGroupRecommendationsState {}

final class GetGroupRecommendationsSuccess
    extends GetGroupRecommendationsState {
  final GetGroupRecommendationsEntity recommendations;

  GetGroupRecommendationsSuccess({required this.recommendations});
}

final class GetGroupRecommendationsError extends GetGroupRecommendationsState {
  final String message;

  GetGroupRecommendationsError({required this.message});
}
