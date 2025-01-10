part of 'get_all_group_bloc.dart';

sealed class GetAllGroupEvent extends Equatable {
  const GetAllGroupEvent();

  @override
  List<Object> get props => [];
}

final class GetAllGroups extends GetAllGroupEvent {
  final GetAllGroupsParams params;

  const GetAllGroups({required this.params});
}
