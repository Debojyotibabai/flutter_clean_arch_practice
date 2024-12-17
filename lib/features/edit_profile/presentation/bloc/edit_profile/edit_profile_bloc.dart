import 'package:clean_architecture_rivaan_ranawat/features/edit_profile/domain/entities/edit_profile_data_entity.dart';
import 'package:clean_architecture_rivaan_ranawat/features/edit_profile/domain/use_cases/get_edit_profile_data_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  final GetEditProfileDataUseCase getEditProfileDataUseCase;

  EditProfileBloc({
    required this.getEditProfileDataUseCase,
  }) : super(EditProfileInitial()) {
    on<GetEditProfileDataEvent>((event, emit) async {
      emit(EditProfileIsLoading());

      final response = await getEditProfileDataUseCase(Params());

      response.fold(
        (err) => emit(EditProfileError(message: err.message)),
        (res) => emit(EditProfileSuccess(editProfileData: res)),
      );
    });
  }
}
