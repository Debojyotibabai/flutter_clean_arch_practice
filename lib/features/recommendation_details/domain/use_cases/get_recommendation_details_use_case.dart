import 'package:clean_architecture_rivaan_ranawat/config/error/failure.dart';
import 'package:clean_architecture_rivaan_ranawat/config/use_case/use_case.dart';
import 'package:clean_architecture_rivaan_ranawat/features/recommendation_details/domain/entities/recommendation_details_entity.dart';
import 'package:clean_architecture_rivaan_ranawat/features/recommendation_details/domain/repositories/recommendation_details_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetRecommendationDetailsUseCase
    implements UseCase<RecommendationDetailsEntity, Params> {
  final RecommendationDetailsRepository recommendationDetailsRepositoryImpl;

  GetRecommendationDetailsUseCase({
    required this.recommendationDetailsRepositoryImpl,
  });

  @override
  Future<Either<Failure, RecommendationDetailsEntity>> call(
      Params params) async {
    return await recommendationDetailsRepositoryImpl.getRecommendationDetails(
      restaurantAddressId: params.restaurantAddressId,
    );
  }
}

class Params {
  final String restaurantAddressId;

  Params({required this.restaurantAddressId});
}
