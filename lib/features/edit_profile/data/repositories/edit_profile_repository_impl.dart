import 'package:clean_architecture_rivaan_ranawat/config/error/failure.dart';
import 'package:clean_architecture_rivaan_ranawat/features/edit_profile/data/data_sources/edit_profile_data_source.dart';
import 'package:clean_architecture_rivaan_ranawat/features/edit_profile/domain/repositories/edit_profile_repository.dart';
import 'package:fpdart/fpdart.dart';

class EditProfileRepositoryImpl implements EditProfileRepository {
  final EditProfileDataSource editProfileDataSourceImpl;

  EditProfileRepositoryImpl({
    required this.editProfileDataSourceImpl,
  });

  @override
  Future<Either<Failure, String>> getEditProfileData() async {
    try {
      final response = await editProfileDataSourceImpl.getEditProfileData();

      return right(response);
    } catch (err) {
      return left(Failure(err.toString()));
    }
  }
}
