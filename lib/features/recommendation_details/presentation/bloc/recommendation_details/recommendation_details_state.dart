part of 'recommendation_details_bloc.dart';

@immutable
sealed class RecommendationDetailsState {}

final class RecommendationDetailsInitial extends RecommendationDetailsState {}

final class RecommendationDetailsIsLoading extends RecommendationDetailsState {}

final class RecommendationDetailsSuccess extends RecommendationDetailsState {
  final RecommendationDetailsEntity recommendationDetails;

  RecommendationDetailsSuccess({
    required this.recommendationDetails,
  });
}

final class RecommendationDetailsFailure extends RecommendationDetailsState {
  final String message;

  RecommendationDetailsFailure({
    required this.message,
  });
}
