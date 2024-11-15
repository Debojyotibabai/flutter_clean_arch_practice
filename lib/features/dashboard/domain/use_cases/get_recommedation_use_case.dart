import 'package:clean_architecture_rivaan_ranawat/config/error/failure.dart';
import 'package:clean_architecture_rivaan_ranawat/config/use_case/use_case.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/domain/repositories/recommendation_repository.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/constants.dart';
import 'package:fpdart/fpdart.dart';

class GetRecommedationUseCase implements UseCase<String, Params> {
  final RecommendationRepository recommendationRepositoryImpl;

  GetRecommedationUseCase({required this.recommendationRepositoryImpl});

  @override
  Future<Either<Failure, String>> call(Params params) async {
    return await recommendationRepositoryImpl.getRecommendation(
      page: params.page,
      size: params.size,
      latitude: params.latitude,
      longitude: params.longitude,
      unit: params.unit,
      sortByOption: params.sortByOption,
      restaurantCategoryIds: params.restaurantCategoryIds,
    );
  }
}

class Params {
  Params({
    required this.page,
    required this.size,
    required this.latitude,
    required this.longitude,
    required this.unit,
    this.sortByOption,
    this.restaurantCategoryIds,
  });

  final int page;
  final int size;
  final double latitude;
  final double longitude;
  final String unit;
  RecommendedFoodsSortByOption? sortByOption;
  String? restaurantCategoryIds;
}
