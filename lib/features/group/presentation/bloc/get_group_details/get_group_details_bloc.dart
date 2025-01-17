import 'package:clean_architecture_rivaan_ranawat/features/group/domain/entities/get_group_details_entity.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/domain/use_cases/get_group_details_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_group_details_event.dart';
part 'get_group_details_state.dart';

class GetGroupDetailsBloc
    extends Bloc<GetGroupDetailsEvent, GetGroupDetailsState> {
  final GetGroupDetailsUseCase getGroupDetailsUseCase;

  GetGroupDetailsBloc({
    required this.getGroupDetailsUseCase,
  }) : super(GetGroupDetailsInitial()) {
    on<GetGroupDetails>(
      (event, emit) async {
        emit(GetGroupDetailsLoading());

        final response = await getGroupDetailsUseCase(
          Params(
            groupId: event.groupId,
          ),
        );

        response.fold(
          (err) => emit(GetGroupDetailsError(message: err.message)),
          (res) => emit(GetGroupDetailsSuccess(groupDetails: res)),
        );
      },
    );
  }
}
