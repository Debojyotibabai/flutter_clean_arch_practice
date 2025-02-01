import 'package:clean_architecture_rivaan_ranawat/config/error/failure.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/domain/entities/get_all_groups_entity.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/domain/entities/get_food_as_per_restaurants_entity.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/domain/entities/get_group_details_entity.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/domain/entities/get_group_participants_entity.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/domain/entities/get_group_recommendations_entity.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/models/group_model.dart';
import 'package:fpdart/fpdart.dart';

abstract class GroupRepository {
  Future<Either<Failure, GetAllGroupsEntity>> getAllGroups({
    required GetAllGroupsParams params,
  });

  Future<Either<Failure, GetGroupDetailsEntity>> getGroupDetails({
    required String groupId,
  });

  Future<Either<Failure, String>> updateGroupDetails({
    required UpdateGroupDetailsParams params,
  });

  Future<Either<Failure, GetGroupRecommendationsEntity>>
      getGroupRecommendations({
    required GetGroupRecommendationsParams params,
  });

  Future<Either<Failure, String>> deleteGroup({required String groupId});

  Future<Either<Failure, GetFoodAsPerRestaurantsEntity>>
      getFoodAsPerRestaurants(
    List<String> restaurantIds,
  );

  Future<Either<Failure, GetGroupParticipantsEntity>> getGroupParticipants(
      {required String groupId});
}
