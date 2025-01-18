import 'package:clean_architecture_rivaan_ranawat/features/group/domain/use_cases/update_group_details_use_case.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/models/group_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'update_group_details_event.dart';
part 'update_group_details_state.dart';

class UpdateGroupDetailsBloc
    extends Bloc<UpdateGroupDetailsEvent, UpdateGroupDetailsState> {
  final UpdateGroupDetailsUseCase updateGroupDetailsUseCase;

  UpdateGroupDetailsBloc({
    required this.updateGroupDetailsUseCase,
  }) : super(UpdateGroupDetailsInitial()) {
    on<UpdateGroupDetails>((event, emit) async {
      emit(UpdateGroupDetailsLoading());

      final response = await updateGroupDetailsUseCase(event.params);

      response.fold(
        (err) => emit(UpdateGroupDetailsFailure(message: err.message)),
        (res) => emit(UpdateGroupDetailsSuccess(message: res)),
      );
    });
  }
}
