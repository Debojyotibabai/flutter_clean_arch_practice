import 'package:clean_architecture_rivaan_ranawat/config/error/failure.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/data/data_sources/food_category_data_source.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/domain/entities/food_category_entity.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/domain/repositories/food_category_repository.dart';
import 'package:fpdart/fpdart.dart';

class FoodCategoryRepositoryImpl implements FoodCategoryRepository {
  FoodCategoryRepositoryImpl({required this.foodCategoryDataSourceImpl});

  final FoodCategoryDataSource foodCategoryDataSourceImpl;

  @override
  Future<Either<Failure, List<FoodCategoryEntity>>> getFoodCategory() async {
    try {
      final response = await foodCategoryDataSourceImpl.getFoodCategory();

      return right(response);
    } catch (err) {
      return left(Failure(err.toString()));
    }
  }
}
