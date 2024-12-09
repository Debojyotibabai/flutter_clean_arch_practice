import 'package:clean_architecture_rivaan_ranawat/config/error/failure.dart';
import 'package:clean_architecture_rivaan_ranawat/features/recommendation_details/domain/entities/foods_for_particular_restaurant_entity.dart';
import 'package:clean_architecture_rivaan_ranawat/features/recommendation_details/domain/entities/recommendation_details_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class RecommendationDetailsRepository {
  Future<Either<Failure, RecommendationDetailsEntity>>
      getRecommendationDetails({
    required String restaurantAddressId,
  });

  Future<Either<Failure, FoodsForParticularRestaurantEntity>>
      getAllFoodsForParticularRestaurant({
    required String restaurantId,
    required int page,
    required int size,
  });
}
