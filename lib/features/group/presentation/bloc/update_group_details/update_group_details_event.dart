part of 'update_group_details_bloc.dart';

sealed class UpdateGroupDetailsEvent {}

final class UpdateGroupDetails extends UpdateGroupDetailsEvent {
  final UpdateGroupDetailsParams params;

  UpdateGroupDetails({required this.params});
}
