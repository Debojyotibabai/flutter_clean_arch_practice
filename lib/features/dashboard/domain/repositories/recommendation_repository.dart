import 'package:clean_architecture_rivaan_ranawat/config/error/failure.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/constants.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class RecommendationRepository {
  Future<Either<Failure, String>> getRecommendation({
    required int page,
    required int size,
    required double latitude,
    required double longitude,
    required String unit,
    RecommendedFoodsSortByOption? sortByOption,
    String? restaurantCategoryIds,
  });
}
