part of 'edit_profile_bloc.dart';

sealed class EditProfileState {}

final class EditProfileInitial extends EditProfileState with EquatableMixin {
  @override
  List<Object?> get props => [];
}

final class EditProfileIsLoading extends EditProfileState with EquatableMixin {
  @override
  List<Object?> get props => [];
}

final class EditProfileSuccess extends EditProfileState with EquatableMixin {
  final String message;

  EditProfileSuccess({required this.message});

  @override
  List<Object?> get props => [message];
}

final class EditProfileError extends EditProfileState with EquatableMixin {
  final String message;

  EditProfileError({required this.message});

  @override
  List<Object?> get props => [message];
}
