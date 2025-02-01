import 'package:clean_architecture_rivaan_ranawat/config/error/failure.dart';
import 'package:clean_architecture_rivaan_ranawat/config/use_case/use_case.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/domain/entities/get_group_participants_entity.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/domain/repositories/group_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetGroupParticipantsUseCase
    implements UseCase<GetGroupParticipantsEntity, GetGroupParticipantsParams> {
  final GroupRepository groupRepositoryImpl;

  GetGroupParticipantsUseCase({required this.groupRepositoryImpl});

  @override
  Future<Either<Failure, GetGroupParticipantsEntity>> call(
      GetGroupParticipantsParams params) async {
    return await groupRepositoryImpl.getGroupParticipants(
        groupId: params.groupId);
  }
}

class GetGroupParticipantsParams {
  final String groupId;

  GetGroupParticipantsParams({required this.groupId});
}
