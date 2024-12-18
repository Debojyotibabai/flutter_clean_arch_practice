part of 'edit_profile_data_bloc.dart';

@immutable
sealed class EditProfileDataState extends Equatable {}

final class EditProfileDataInitial extends EditProfileDataState {
  @override
  List<Object?> get props => [];
}

final class EditProfileDataIsLoading extends EditProfileDataState {
  @override
  List<Object?> get props => [];
}

final class EditProfileDataSuccess extends EditProfileDataState {
  final EditProfileDataEntity editProfileData;

  EditProfileDataSuccess({
    required this.editProfileData,
  });

  @override
  List<Object?> get props => [editProfileData];
}

final class EditProfileDataError extends EditProfileDataState {
  final String message;
  EditProfileDataError({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}
