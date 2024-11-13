part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

final class EmailLoginEvent extends LoginEvent {
  final String email;
  final String password;

  EmailLoginEvent({
    required this.email,
    required this.password,
  });
}
