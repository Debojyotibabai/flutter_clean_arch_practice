import 'package:clean_architecture_rivaan_ranawat/config/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class RecommendationDetailsRepository {
  Future<Either<Failure, String>> getRecommendationDetails({
    required String restaurantId,
  });
}
