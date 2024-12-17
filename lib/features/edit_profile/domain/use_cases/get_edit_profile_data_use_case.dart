import 'package:clean_architecture_rivaan_ranawat/config/error/failure.dart';
import 'package:clean_architecture_rivaan_ranawat/config/use_case/use_case.dart';
import 'package:clean_architecture_rivaan_ranawat/features/edit_profile/domain/entities/edit_profile_data_entity.dart';
import 'package:clean_architecture_rivaan_ranawat/features/edit_profile/domain/repositories/edit_profile_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetEditProfileDataUseCase
    implements UseCase<EditProfileDataEntity, Params> {
  final EditProfileRepository editProfileRepositoryImpl;

  GetEditProfileDataUseCase({
    required this.editProfileRepositoryImpl,
  });

  @override
  Future<Either<Failure, EditProfileDataEntity>> call(Params params) async {
    return await editProfileRepositoryImpl.getEditProfileData();
  }
}

class Params {}
