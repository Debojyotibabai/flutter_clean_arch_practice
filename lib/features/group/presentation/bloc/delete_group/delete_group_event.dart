part of 'delete_group_bloc.dart';

sealed class DeleteGroupEvent {}

final class DeleteGroup extends DeleteGroupEvent {
  final String groupId;

  DeleteGroup({required this.groupId});
}
