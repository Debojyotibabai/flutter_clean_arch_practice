import 'package:clean_architecture_rivaan_ranawat/config/error/failure.dart';
import 'package:clean_architecture_rivaan_ranawat/config/use_case/use_case.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/domain/entities/get_all_groups_entity.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/domain/repositories/group_repository.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/models/group_model.dart';
import 'package:fpdart/fpdart.dart';

class GetAllGroupsUseCase
    implements UseCase<GetAllGroupsEntity, GetAllGroupsParams> {
  final GroupRepository groupRepositoryImpl;

  GetAllGroupsUseCase({required this.groupRepositoryImpl});

  @override
  Future<Either<Failure, GetAllGroupsEntity>> call(
      GetAllGroupsParams params) async {
    return await groupRepositoryImpl.getAllGroups(params: params);
  }
}
