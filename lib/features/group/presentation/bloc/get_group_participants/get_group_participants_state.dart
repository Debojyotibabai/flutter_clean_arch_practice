part of 'get_group_participants_bloc.dart';

sealed class GetGroupParticipantsState {}

final class GetGroupParticipantsInitial extends GetGroupParticipantsState {}

final class GetGroupParticipantsIsLoading extends GetGroupParticipantsState {}

final class GetGroupParticipantsSuccess extends GetGroupParticipantsState {
  final GetGroupParticipantsEntity participants;

  GetGroupParticipantsSuccess({required this.participants});
}

final class GetGroupParticipantsError extends GetGroupParticipantsState {
  final String message;

  GetGroupParticipantsError({required this.message});
}
