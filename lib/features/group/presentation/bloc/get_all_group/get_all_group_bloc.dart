import 'package:clean_architecture_rivaan_ranawat/features/group/domain/entities/get_all_groups_entity.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/domain/use_cases/get_all_groups_use_case.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/models/group_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_all_group_event.dart';
part 'get_all_group_state.dart';

class GetAllGroupBloc extends Bloc<GetAllGroupEvent, GetAllGroupState> {
  final GetAllGroupsUseCase getAllGroupsUseCase;

  GetAllGroupBloc({
    required this.getAllGroupsUseCase,
  }) : super(GetAllGroupInitial()) {
    on<GetAllGroups>(
      (event, emit) async {
        emit(GetAllGroupLoading());

        final response = await getAllGroupsUseCase(
          GetAllGroupsParams(
            page: event.params.page,
            size: event.params.size,
          ),
        );

        response.fold(
          (err) => emit(GetAllGroupError(message: err.message)),
          (res) => emit(GetAllGroupSuccess(group: res)),
        );
      },
    );
  }
}
