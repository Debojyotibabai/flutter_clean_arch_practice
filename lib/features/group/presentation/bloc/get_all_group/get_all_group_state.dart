part of 'get_all_group_bloc.dart';

sealed class GetAllGroupState {
  const GetAllGroupState();
}

final class GetAllGroupInitial extends GetAllGroupState {}

final class GetAllGroupLoading extends GetAllGroupState {}

final class GetAllGroupSuccess extends GetAllGroupState {
  final GetAllGroupsEntity group;

  const GetAllGroupSuccess({required this.group});
}

final class GetAllGroupError extends GetAllGroupState {
  final String message;

  const GetAllGroupError({required this.message});
}
