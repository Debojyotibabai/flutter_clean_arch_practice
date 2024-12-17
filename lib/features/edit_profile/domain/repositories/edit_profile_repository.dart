import 'package:clean_architecture_rivaan_ranawat/config/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class EditProfileRepository {
  Future<Either<Failure, String>> getEditProfileData();
}
