part of 'edit_profile_bloc.dart';

@immutable
sealed class EditProfileState extends Equatable {}

final class EditProfileInitial extends EditProfileState {
  @override
  List<Object?> get props => [];
}

final class EditProfileIsLoading extends EditProfileState {
  @override
  List<Object?> get props => [];
}

final class EditProfileSuccess extends EditProfileState {
  final EditProfileDataEntity editProfileData;

  EditProfileSuccess({
    required this.editProfileData,
  });

  @override
  List<Object?> get props => [editProfileData];
}

final class EditProfileError extends EditProfileState {
  final String message;
  EditProfileError({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}
