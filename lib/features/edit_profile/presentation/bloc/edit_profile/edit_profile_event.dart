part of 'edit_profile_bloc.dart';

sealed class EditProfileEvent {}

final class UpdateEditProfileEvent extends EditProfileEvent {
  final String? profilePicture;
  final String? firstName;
  final String? lastName;
  final String? emailAddress;
  final String? phoneCountryCode;
  final String? phoneNumber;
  UpdateEditProfileEvent({
    required this.profilePicture,
    required this.firstName,
    required this.lastName,
    required this.emailAddress,
    required this.phoneCountryCode,
    required this.phoneNumber,
  });
}
