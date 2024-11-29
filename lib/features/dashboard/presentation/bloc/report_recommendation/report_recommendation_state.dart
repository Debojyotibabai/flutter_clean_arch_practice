part of 'report_recommendation_bloc.dart';

@immutable
sealed class ReportRecommendationState {}

final class ReportRecommendationInitial extends ReportRecommendationState {}

final class ReportRecommendationLoading extends ReportRecommendationState {}

final class ReportRecommendationSuccess extends ReportRecommendationState {
  final String message;
  ReportRecommendationSuccess({required this.message});
}

final class ReportRecommendationError extends ReportRecommendationState {
  final String message;
  ReportRecommendationError({required this.message});
}
