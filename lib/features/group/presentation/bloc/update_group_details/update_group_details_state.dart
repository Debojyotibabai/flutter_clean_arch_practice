part of 'update_group_details_bloc.dart';

sealed class UpdateGroupDetailsState {}

final class UpdateGroupDetailsInitial extends UpdateGroupDetailsState {}

final class UpdateGroupDetailsLoading extends UpdateGroupDetailsState {}

final class UpdateGroupDetailsSuccess extends UpdateGroupDetailsState {
  final String message;

  UpdateGroupDetailsSuccess({required this.message});
}

final class UpdateGroupDetailsFailure extends UpdateGroupDetailsState {
  final String message;

  UpdateGroupDetailsFailure({required this.message});
}
