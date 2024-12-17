import 'package:clean_architecture_rivaan_ranawat/config/error/failure.dart';
import 'package:clean_architecture_rivaan_ranawat/config/use_case/use_case.dart';
import 'package:clean_architecture_rivaan_ranawat/features/edit_profile/domain/repositories/edit_profile_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetEditProfileDataUseCase implements UseCase<String, Params> {
  final EditProfileRepository editProfileRepositoryImpl;

  GetEditProfileDataUseCase({
    required this.editProfileRepositoryImpl,
  });

  @override
  Future<Either<Failure, String>> call(Params params) async {
    return await editProfileRepositoryImpl.getEditProfileData();
  }
}

class Params {}
