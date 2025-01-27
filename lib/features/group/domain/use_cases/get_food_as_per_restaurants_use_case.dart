import 'package:clean_architecture_rivaan_ranawat/config/error/failure.dart';
import 'package:clean_architecture_rivaan_ranawat/config/use_case/use_case.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/domain/entities/get_food_as_per_restaurants_entity.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/domain/repositories/group_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetFoodAsPerRestaurantsUseCase
    implements
        UseCase<GetFoodAsPerRestaurantsEntity, GetFoodAsPerRestaurantsParams> {
  final GroupRepository groupRepositoryImpl;

  GetFoodAsPerRestaurantsUseCase({
    required this.groupRepositoryImpl,
  });

  @override
  Future<Either<Failure, GetFoodAsPerRestaurantsEntity>> call(
      GetFoodAsPerRestaurantsParams params) async {
    return await groupRepositoryImpl
        .getFoodAsPerRestaurants(params.restaurantIds);
  }
}

class GetFoodAsPerRestaurantsParams {
  final List<String> restaurantIds;

  GetFoodAsPerRestaurantsParams({
    required this.restaurantIds,
  });
}
