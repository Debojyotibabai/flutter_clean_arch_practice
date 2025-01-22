import 'package:clean_architecture_rivaan_ranawat/features/group/domain/use_cases/delete_group_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'delete_group_event.dart';
part 'delete_group_state.dart';

class DeleteGroupBloc extends Bloc<DeleteGroupEvent, DeleteGroupState> {
  final DeleteGroupUseCase deleteGroupUseCase;

  DeleteGroupBloc({
    required this.deleteGroupUseCase,
  }) : super(DeleteGroupInitial()) {
    on<DeleteGroup>((event, emit) async {
      emit(DeleteGroupLoading());

      final response = await deleteGroupUseCase(
        DeleteGroupParams(
          groupId: event.groupId,
        ),
      );

      response.fold(
        (err) => emit(DeleteGroupError(message: err.message)),
        (res) => emit(DeleteGroupSuccess(message: res)),
      );
    });
  }
}
