import 'package:clean_architecture_rivaan_ranawat/config/error/failure.dart';
import 'package:clean_architecture_rivaan_ranawat/features/auth/data/data_sources/auth_data_source.dart';
import 'package:clean_architecture_rivaan_ranawat/features/auth/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSourceImpl;

  AuthRepositoryImpl({required this.authDataSourceImpl});

  @override
  Future<Either<Failure, String>> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await authDataSourceImpl.loginWithEmailPassword(
        email: email,
        password: password,
      );

      return right(response);
    } catch (err) {
      return left(Failure(err.toString()));
    }
  }
}
