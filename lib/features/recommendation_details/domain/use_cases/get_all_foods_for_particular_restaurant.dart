import 'package:clean_architecture_rivaan_ranawat/config/error/failure.dart';
import 'package:clean_architecture_rivaan_ranawat/config/use_case/use_case.dart';
import 'package:clean_architecture_rivaan_ranawat/features/recommendation_details/domain/repositories/recommendation_details_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetAllFoodsForParticularRestaurantUseCase
    implements UseCase<String, Params> {
  final RecommendationDetailsRepository recommendationDetailsRepositoryImpl;

  GetAllFoodsForParticularRestaurantUseCase({
    required this.recommendationDetailsRepositoryImpl,
  });

  @override
  Future<Either<Failure, String>> call(Params params) async {
    return await recommendationDetailsRepositoryImpl
        .getAllFoodsForParticularRestaurant(
      restaurantId: params.restaurantId,
      page: params.page,
      size: params.size,
    );
  }
}

class Params {
  final String restaurantId;
  final int page;
  final int size;

  Params({
    required this.restaurantId,
    required this.page,
    required this.size,
  });
}
