import 'package:clean_architecture_rivaan_ranawat/config/error/failure.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/data/data_sources/recommendation_data_source.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/domain/repositories/recommendation_repository.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/constants.dart';
import 'package:fpdart/fpdart.dart';

class RecommendationRepositoryImpl implements RecommendationRepository {
  final RecommendationDataSource recommendationDataSourceImpl;

  RecommendationRepositoryImpl({required this.recommendationDataSourceImpl});

  @override
  Future<Either<Failure, String>> getRecommendation({
    required int page,
    required int size,
    required double latitude,
    required double longitude,
    required String unit,
    RecommendedFoodsSortByOption? sortByOption,
    String? restaurantCategoryIds,
  }) async {
    try {
      final response = await recommendationDataSourceImpl.getRecommendation(
        page: page,
        size: size,
        latitude: latitude,
        longitude: longitude,
        unit: unit,
        sortByOption: sortByOption,
        restaurantCategoryIds: restaurantCategoryIds,
      );

      return right(response);
    } catch (err) {
      return left(Failure(err.toString()));
    }
  }
}
