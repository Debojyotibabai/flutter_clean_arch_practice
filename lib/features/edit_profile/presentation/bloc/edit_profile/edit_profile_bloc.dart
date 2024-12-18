import 'package:bloc/bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/edit_profile/domain/use_cases/edit_profile_use_case.dart';
import 'package:equatable/equatable.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  final EditProfileUseCase editProfileUseCase;

  EditProfileBloc({
    required this.editProfileUseCase,
  }) : super(EditProfileInitial()) {
    on<UpdateEditProfileEvent>(
      (event, emit) async {
        emit(EditProfileIsLoading());

        final response = await editProfileUseCase(Params(
          profilePicture: event.profilePicture,
          firstName: event.firstName,
          lastName: event.lastName,
          emailAddress: event.emailAddress,
          phoneCountryCode: event.phoneCountryCode,
          phoneNumber: event.phoneNumber,
        ));

        response.fold(
          (err) {
            emit(EditProfileError(message: err.message));
          },
          (res) {
            emit(EditProfileSuccess(message: res));
          },
        );
      },
    );
  }
}
