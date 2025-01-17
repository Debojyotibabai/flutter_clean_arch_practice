part of 'get_group_details_bloc.dart';

sealed class GetGroupDetailsEvent {
  const GetGroupDetailsEvent();
}

class GetGroupDetails extends GetGroupDetailsEvent {
  final String groupId;

  GetGroupDetails({
    required this.groupId,
  });
}
