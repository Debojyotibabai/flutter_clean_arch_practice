import 'package:clean_architecture_rivaan_ranawat/config/error/failure.dart';
import 'package:clean_architecture_rivaan_ranawat/config/use_case/use_case.dart';
import 'package:clean_architecture_rivaan_ranawat/features/recommendation_details/domain/repositories/recommendation_details_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetRecommendationDetailsUseCase implements UseCase<String, Params> {
  final RecommendationDetailsRepository recommendationDetailsRepositoryImpl;

  GetRecommendationDetailsUseCase({
    required this.recommendationDetailsRepositoryImpl,
  });

  @override
  Future<Either<Failure, String>> call(Params params) async {
    return await recommendationDetailsRepositoryImpl.getRecommendationDetails(
      restaurantId: params.restaurantId,
    );
  }
}

class Params {
  final String restaurantId;

  Params({required this.restaurantId});
}
