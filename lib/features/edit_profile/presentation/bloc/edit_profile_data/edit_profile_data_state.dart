part of 'edit_profile_data_bloc.dart';

@immutable
sealed class EditProfileDataState {}

final class EditProfileDataInitial extends EditProfileDataState
    with EquatableMixin {
  @override
  List<Object?> get props => [];
}

final class EditProfileDataIsLoading extends EditProfileDataState
    with EquatableMixin {
  @override
  List<Object?> get props => [];
}

final class EditProfileDataSuccess extends EditProfileDataState
    with EquatableMixin {
  final EditProfileDataEntity editProfileData;

  EditProfileDataSuccess({
    required this.editProfileData,
  });

  @override
  List<Object?> get props => [editProfileData];
}

final class EditProfileDataError extends EditProfileDataState
    with EquatableMixin {
  final String message;
  EditProfileDataError({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}
