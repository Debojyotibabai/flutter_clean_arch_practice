part of 'recommendation_bloc.dart';

@immutable
sealed class RecommendationEvent {}

final class GetRecommendationEvent extends RecommendationEvent {
  final int page;
  final int size;
  final double latitude;
  final double longitude;
  final String unit;
  final RecommendedFoodsSortByOption? sortByOption;
  final String? restaurantCategoryIds;

  GetRecommendationEvent({
    required this.page,
    required this.size,
    required this.latitude,
    required this.longitude,
    required this.unit,
    required this.sortByOption,
    required this.restaurantCategoryIds,
  });
}

final class UpdateIsReportFoodOptionAvailabilityEvent
    extends RecommendationEvent {
  final String id;

  UpdateIsReportFoodOptionAvailabilityEvent({required this.id});
}

final class UpdateRecommendationEvent extends RecommendationEvent {
  final String id;

  UpdateRecommendationEvent({required this.id});
}
