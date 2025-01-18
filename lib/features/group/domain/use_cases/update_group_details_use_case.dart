import 'package:clean_architecture_rivaan_ranawat/config/error/failure.dart';
import 'package:clean_architecture_rivaan_ranawat/config/use_case/use_case.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/domain/repositories/group_repository.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/models/group_model.dart';
import 'package:fpdart/fpdart.dart';

class UpdateGroupDetailsUseCase
    implements UseCase<String, UpdateGroupDetailsParams> {
  final GroupRepository groupRepositoryImpl;

  UpdateGroupDetailsUseCase({
    required this.groupRepositoryImpl,
  });

  @override
  Future<Either<Failure, String>> call(UpdateGroupDetailsParams params) async {
    return await groupRepositoryImpl.updateGroupDetails(params: params);
  }
}
