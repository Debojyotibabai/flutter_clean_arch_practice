import 'package:meta/meta.dart';
import 'package:clean_architecture_rivaan_ranawat/config/error/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AppStartedEvent>(
      (event, emit) async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();

        emit(AuthenticationLoading());

        if (prefs.getBool("isAuthenticated") == true) {
          emit(AuthenticationSuccess());
        } else {
          emit(AuthenticationError(Failure("Not Authenticated")));
        }
      },
    );

    on<LoggedInEvent>(
      (event, emit) async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();

        emit(AuthenticationLoading());

        try {
          await prefs.setString("token", event.token);
          await prefs.setBool("isAuthenticated", true);
          emit(AuthenticationSuccess());
        } catch (err) {
          emit(AuthenticationError(Failure()));
        }
      },
    );
  }
}
