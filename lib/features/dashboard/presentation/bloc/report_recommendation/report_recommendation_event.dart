part of 'report_recommendation_bloc.dart';

@immutable
sealed class ReportRecommendationEvent {}

final class ReportRecommendedFoodEvent extends ReportRecommendationEvent {
  final String foodId;
  final String reportType;

  ReportRecommendedFoodEvent({required this.foodId, required this.reportType});
}
