part of 'delete_group_bloc.dart';

sealed class DeleteGroupState {}

final class DeleteGroupInitial extends DeleteGroupState {}

final class DeleteGroupLoading extends DeleteGroupState {}

final class DeleteGroupSuccess extends DeleteGroupState {
  final String message;

  DeleteGroupSuccess({required this.message});
}

final class DeleteGroupError extends DeleteGroupState {
  final String message;

  DeleteGroupError({required this.message});
}
