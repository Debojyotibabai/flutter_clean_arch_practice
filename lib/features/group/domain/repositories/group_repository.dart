import 'package:clean_architecture_rivaan_ranawat/config/error/failure.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/domain/entities/get_all_groups_entity.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/models/group_model.dart';
import 'package:fpdart/fpdart.dart';

abstract class GroupRepository {
  Future<Either<Failure, GetAllGroupsEntity>> getAllGroups({
    required GetAllGroupsParams params,
  });
}
