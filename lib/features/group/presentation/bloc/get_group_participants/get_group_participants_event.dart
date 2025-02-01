part of 'get_group_participants_bloc.dart';

sealed class GetGroupParticipantsEvent {}

final class GetGroupParticipants extends GetGroupParticipantsEvent {
  final String groupId;

  GetGroupParticipants({required this.groupId});
}
