import 'package:clean_architecture_rivaan_ranawat/features/edit_profile/domain/entities/edit_profile_data_entity.dart';
import 'package:clean_architecture_rivaan_ranawat/features/edit_profile/domain/use_cases/get_edit_profile_data_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'edit_profile_data_event.dart';
part 'edit_profile_data_state.dart';

class EditProfileDataBloc
    extends Bloc<EditProfileDataEvent, EditProfileDataState> {
  final GetEditProfileDataUseCase getEditProfileDataUseCase;

  EditProfileDataBloc({
    required this.getEditProfileDataUseCase,
  }) : super(EditProfileDataInitial()) {
    on<GetEditProfileDataEvent>((event, emit) async {
      emit(EditProfileDataIsLoading());

      final response = await getEditProfileDataUseCase(Params());

      response.fold(
        (err) => emit(EditProfileDataError(message: err.message)),
        (res) => emit(EditProfileDataSuccess(editProfileData: res)),
      );
    });
  }
}
