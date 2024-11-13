import 'package:clean_architecture_rivaan_ranawat/config/error/failure.dart';
import 'package:clean_architecture_rivaan_ranawat/config/use_case/use_case.dart';
import 'package:clean_architecture_rivaan_ranawat/features/auth/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class LoginUseCase implements UseCase<String, LoginUseCaseParams> {
  final AuthRepository authRepositoryImpl;

  const LoginUseCase({required this.authRepositoryImpl});

  @override
  Future<Either<Failure, String>> call(LoginUseCaseParams params) async {
    return await authRepositoryImpl.loginWithEmailPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class LoginUseCaseParams {
  final String email;
  final String password;

  LoginUseCaseParams({
    required this.email,
    required this.password,
  });
}
