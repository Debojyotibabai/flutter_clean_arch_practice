import 'package:clean_architecture_rivaan_ranawat/config/error/failure.dart';
import 'package:clean_architecture_rivaan_ranawat/config/use_case/use_case.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/domain/repositories/group_repository.dart';
import 'package:fpdart/fpdart.dart';

class DeleteGroupUseCase implements UseCase<String, DeleteGroupParams> {
  final GroupRepository groupRepositoryImpl;

  DeleteGroupUseCase({required this.groupRepositoryImpl});

  @override
  Future<Either<Failure, String>> call(DeleteGroupParams params) async {
    return await groupRepositoryImpl.deleteGroup(groupId: params.groupId);
  }
}

class DeleteGroupParams {
  final String groupId;

  DeleteGroupParams({
    required this.groupId,
  });
}
