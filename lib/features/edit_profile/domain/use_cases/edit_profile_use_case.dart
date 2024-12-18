import 'package:clean_architecture_rivaan_ranawat/config/error/failure.dart';
import 'package:clean_architecture_rivaan_ranawat/config/use_case/use_case.dart';
import 'package:clean_architecture_rivaan_ranawat/features/edit_profile/domain/repositories/edit_profile_repository.dart';
import 'package:fpdart/fpdart.dart';

class EditProfileUseCase implements UseCase<String, Params> {
  final EditProfileRepository editProfileRepositoryImpl;

  EditProfileUseCase({
    required this.editProfileRepositoryImpl,
  });

  @override
  Future<Either<Failure, String>> call(Params params) async {
    return await editProfileRepositoryImpl.editProfile(
      profilePicture: params.profilePicture,
      firstName: params.firstName,
      lastName: params.lastName,
      emailAddress: params.emailAddress,
      phoneCountryCode: params.phoneCountryCode,
      phoneNumber: params.phoneNumber,
    );
  }
}

class Params {
  final String? profilePicture;
  final String? firstName;
  final String? lastName;
  final String? emailAddress;
  final String? phoneCountryCode;
  final String? phoneNumber;
  Params({
    this.profilePicture,
    this.firstName,
    this.lastName,
    this.emailAddress,
    this.phoneCountryCode,
    this.phoneNumber,
  });
}
