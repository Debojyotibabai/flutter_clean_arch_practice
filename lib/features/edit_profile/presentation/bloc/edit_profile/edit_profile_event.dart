part of 'edit_profile_bloc.dart';

@immutable
sealed class EditProfileEvent {}

final class GetEditProfileDataEvent extends EditProfileEvent {}
