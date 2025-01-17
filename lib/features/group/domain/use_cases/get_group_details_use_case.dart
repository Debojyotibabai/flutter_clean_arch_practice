import 'package:clean_architecture_rivaan_ranawat/config/error/failure.dart';
import 'package:clean_architecture_rivaan_ranawat/config/use_case/use_case.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/domain/entities/get_group_details_entity.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/domain/repositories/group_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetGroupDetailsUseCase implements UseCase<GetGroupDetailsEntity, Params> {
  final GroupRepository groupRepositoryImpl;

  GetGroupDetailsUseCase({
    required this.groupRepositoryImpl,
  });

  @override
  Future<Either<Failure, GetGroupDetailsEntity>> call(Params params) async {
    return await groupRepositoryImpl.getGroupDetails(
      groupId: params.groupId,
    );
  }
}

class Params {
  final String groupId;

  Params({
    required this.groupId,
  });
}
