import 'package:clean_architecture_rivaan_ranawat/config/error/failure.dart';
import 'package:clean_architecture_rivaan_ranawat/config/use_case/use_case.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/domain/entities/food_category_entity.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/domain/repositories/food_category_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetFoodCategoryUseCase
    implements UseCase<List<FoodCategoryEntity>, NoParams> {
  final FoodCategoryRepository foodCategoryRepositoryImpl;

  GetFoodCategoryUseCase({required this.foodCategoryRepositoryImpl});

  @override
  Future<Either<Failure, List<FoodCategoryEntity>>> call(
      NoParams params) async {
    return await foodCategoryRepositoryImpl.getFoodCategory();
  }
}

class NoParams {}
