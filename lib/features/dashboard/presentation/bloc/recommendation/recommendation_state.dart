part of 'recommendation_bloc.dart';

@immutable
sealed class RecommendationState {}

final class RecommendationInitial extends RecommendationState {}

final class RecommendationLoading extends RecommendationState {}

final class RecommendationSuccess extends RecommendationState {
  final List<RecommendationEntity> recommendations;
  RecommendationSuccess({required this.recommendations});
}

final class RecommendationError extends RecommendationState {
  final String message;
  RecommendationError({required this.message});
}
