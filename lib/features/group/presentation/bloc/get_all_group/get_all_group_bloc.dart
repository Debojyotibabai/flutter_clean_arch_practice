import 'package:clean_architecture_rivaan_ranawat/features/group/domain/entities/get_all_groups_entity.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/domain/use_cases/get_all_groups_use_case.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/models/group_model.dart';
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
        if (event.params.page <= 1) {
          emit(GetAllGroupLoading());
        }

        List<GroupEntity> previousGroups = [];

        if (state is GetAllGroupSuccess) {
          previousGroups = (state as GetAllGroupSuccess).group.groups!;
        }

        final response = await getAllGroupsUseCase(
          GetAllGroupsParams(
            page: event.params.page,
            size: event.params.size,
          ),
        );

        response.fold(
          (err) => emit(GetAllGroupError(message: err.message)),
          (res) {
            if (event.params.page <= 1) {
              emit(GetAllGroupSuccess(group: res));
            } else {
              final groups = [...previousGroups, ...res.groups!];
              emit(
                GetAllGroupSuccess(
                  group: (state as GetAllGroupSuccess).group.copyWith(
                        pagination: res.pagination,
                        groups: groups,
                      ),
                ),
              );
            }
          },
        );
      },
    );
  }
}
