import 'package:clean_architecture_rivaan_ranawat/config/error/failure.dart';
import 'package:clean_architecture_rivaan_ranawat/features/edit_profile/data/data_sources/edit_profile_data_source.dart';
import 'package:clean_architecture_rivaan_ranawat/features/edit_profile/data/models/edit_profile_data_model.dart';
import 'package:clean_architecture_rivaan_ranawat/features/edit_profile/domain/repositories/edit_profile_repository.dart';
import 'package:fpdart/fpdart.dart';

class EditProfileRepositoryImpl implements EditProfileRepository {
  final EditProfileDataSource editProfileDataSourceImpl;

  EditProfileRepositoryImpl({
    required this.editProfileDataSourceImpl,
  });

  @override
  Future<Either<Failure, EditProfileDataModel>> getEditProfileData() async {
    try {
      final response = await editProfileDataSourceImpl.getEditProfileData();

      return right(response);
    } catch (err) {
      return left(Failure(err.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> editProfile({
    required String? profilePicture,
    required String? firstName,
    required String? lastName,
    required String? emailAddress,
    required String? phoneCountryCode,
    required String? phoneNumber,
  }) async {
    try {
      final response = await editProfileDataSourceImpl.editProfile(
        profilePicture: profilePicture,
        firstName: firstName,
        lastName: lastName,
        emailAddress: emailAddress,
        phoneCountryCode: phoneCountryCode,
        phoneNumber: phoneNumber,
      );

      return right(response);
    } catch (err) {
      {
        return left(Failure(err.toString()));
      }
    }
  }
}
