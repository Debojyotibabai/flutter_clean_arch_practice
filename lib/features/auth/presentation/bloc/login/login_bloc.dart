import 'package:meta/meta.dart';
import 'package:clean_architecture_rivaan_ranawat/features/auth/domain/use_cases/login_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc({required this.loginUseCase}) : super(LoginInitial()) {
    on<EmailLoginEvent>(
      (event, emit) async {
        emit(LoginLoading());

        final response = await loginUseCase(
          LoginUseCaseParams(
            email: event.email,
            password: event.password,
          ),
        );

        response.fold(
          (err) => emit(LoginError(err.message)),
          (token) => emit(LoginSuccess(token)),
        );
      },
    );
  }
}
