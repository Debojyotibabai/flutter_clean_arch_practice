import 'package:clean_architecture_rivaan_ranawat/config/error/failure.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/domain/entities/food_category_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class FoodCategoryRepository {
  Future<Either<Failure, List<FoodCategoryEntity>>> getFoodCategory();
}
