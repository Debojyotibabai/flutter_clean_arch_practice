import 'package:clean_architecture_rivaan_ranawat/config/error/failure.dart';
import 'package:clean_architecture_rivaan_ranawat/config/use_case/use_case.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/domain/repositories/recommendation_repository.dart';
import 'package:fpdart/fpdart.dart';

class ReportRecommendedFoodUseCase implements UseCase<String, Params> {
  final RecommendationRepository recommendationRepositoryImpl;

  ReportRecommendedFoodUseCase({
    required this.recommendationRepositoryImpl,
  });

  @override
  Future<Either<Failure, String>> call(Params params) async {
    return await recommendationRepositoryImpl.reportRecommendedFood(
      foodId: params.foodId,
      reportType: params.reportType,
    );
  }
}

class Params {
  final String foodId;
  final String reportType;

  Params({
    required this.foodId,
    required this.reportType,
  });
}
