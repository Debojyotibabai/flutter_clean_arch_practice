part of 'edit_profile_bloc.dart';

@immutable
sealed class EditProfileState {}

final class EditProfileInitial extends EditProfileState with EquatableMixin {
  @override
  List<Object?> get props => [];
}

final class EditProfileLoading extends EditProfileState with EquatableMixin {
  @override
  List<Object?> get props => [];
}

final class EditProfileSuccess extends EditProfileState with EquatableMixin {
  final String editProfileData;

  EditProfileSuccess({
    required this.editProfileData,
  });

  @override
  List<Object?> get props => [editProfileData];
}

final class EditProfileError extends EditProfileState with EquatableMixin {
  final String message;
  EditProfileError({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}
