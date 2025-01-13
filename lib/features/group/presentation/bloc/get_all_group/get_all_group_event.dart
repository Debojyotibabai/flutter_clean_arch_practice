part of 'get_all_group_bloc.dart';

sealed class GetAllGroupEvent {
  const GetAllGroupEvent();
}

final class GetAllGroups extends GetAllGroupEvent {
  final GetAllGroupsParams params;

  const GetAllGroups({required this.params});
}
