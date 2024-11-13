part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent {}

final class AppStartedEvent extends AuthenticationEvent {}

final class LoggedInEvent extends AuthenticationEvent {
  final String token;

  LoggedInEvent({required this.token});
}

final class LoggedOutEvent extends AuthenticationEvent {}
