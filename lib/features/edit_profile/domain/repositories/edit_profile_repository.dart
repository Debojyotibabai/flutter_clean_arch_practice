import 'package:clean_architecture_rivaan_ranawat/config/error/failure.dart';
import 'package:clean_architecture_rivaan_ranawat/features/edit_profile/domain/entities/edit_profile_data_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class EditProfileRepository {
  Future<Either<Failure, EditProfileDataEntity>> getEditProfileData();

  Future<Either<Failure, String>> editProfile({
    required String? profilePicture,
    required String? firstName,
    required String? lastName,
    required String? emailAddress,
    required String? phoneCountryCode,
    required String? phoneNumber,
  });
}
