import 'package:clean_architecture_rivaan_ranawat/features/group/domain/entities/get_group_participants_entity.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/domain/use_cases/get_group_participants_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_group_participants_event.dart';
part 'get_group_participants_state.dart';

class GetGroupParticipantsBloc
    extends Bloc<GetGroupParticipantsEvent, GetGroupParticipantsState> {
  final GetGroupParticipantsUseCase getGroupParticipantsUseCase;

  GetGroupParticipantsBloc({
    required this.getGroupParticipantsUseCase,
  }) : super(GetGroupParticipantsInitial()) {
    on<GetGroupParticipants>((event, emit) async {
      emit(GetGroupParticipantsIsLoading());

      final response = await getGroupParticipantsUseCase(
          GetGroupParticipantsParams(groupId: event.groupId));

      response.fold(
        (err) => emit(GetGroupParticipantsError(message: err.message)),
        (res) => emit(GetGroupParticipantsSuccess(participants: res)),
      );
    });
  }
}
