import 'package:clean_architecture_rivaan_ranawat/config/error/failure.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/data/data_sources/recommendation_data_source.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/data/models/recommendation_model.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/domain/repositories/recommendation_repository.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/constants.dart';
import 'package:fpdart/fpdart.dart';

class RecommendationRepositoryImpl implements RecommendationRepository {
  final RecommendationDataSource recommendationDataSourceImpl;

  RecommendationRepositoryImpl({required this.recommendationDataSourceImpl});

  @override
  Future<Either<Failure, RecommendationModel>> getRecommendation({
    required int page,
    required int size,
    required double latitude,
    required double longitude,
    required String unit,
    required RecommendedFoodsSortByOption? sortByOption,
    required String? restaurantCategoryIds,
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
