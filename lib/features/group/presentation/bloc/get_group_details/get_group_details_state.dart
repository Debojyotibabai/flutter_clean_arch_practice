part of 'get_group_details_bloc.dart';

sealed class GetGroupDetailsState {
  const GetGroupDetailsState();
}

final class GetGroupDetailsInitial extends GetGroupDetailsState {}

final class GetGroupDetailsLoading extends GetGroupDetailsState {}

final class GetGroupDetailsSuccess extends GetGroupDetailsState {
  final GetGroupDetailsEntity groupDetails;
  const GetGroupDetailsSuccess({
    required this.groupDetails,
  });
}

final class GetGroupDetailsError extends GetGroupDetailsState {
  final String message;

  const GetGroupDetailsError({
    required this.message,
  });
}
