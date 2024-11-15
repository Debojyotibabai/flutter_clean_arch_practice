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
    this.sortByOption,
    this.restaurantCategoryIds,
  });
}
