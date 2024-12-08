import 'package:clean_architecture_rivaan_ranawat/config/error/failure.dart';
import 'package:clean_architecture_rivaan_ranawat/features/recommendation_details/data/data_sources/recommendation_details_data_source.dart';
import 'package:clean_architecture_rivaan_ranawat/features/recommendation_details/data/models/recommendation_details_model.dart';
import 'package:clean_architecture_rivaan_ranawat/features/recommendation_details/domain/repositories/recommendation_details_repository.dart';
import 'package:fpdart/fpdart.dart';

class RecommendationDetailsRepositoryImpl
    implements RecommendationDetailsRepository {
  final RecommendationDetailsDataSource recommendationDetailsDataSourceImpl;

  RecommendationDetailsRepositoryImpl({
    required this.recommendationDetailsDataSourceImpl,
  });

  @override
  Future<Either<Failure, RecommendationDetailsModel>> getRecommendationDetails(
      {required String restaurantId}) async {
    try {
      final response =
          await recommendationDetailsDataSourceImpl.getRecommendationDetails(
        restaurantId: restaurantId,
      );

      return right(response);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
