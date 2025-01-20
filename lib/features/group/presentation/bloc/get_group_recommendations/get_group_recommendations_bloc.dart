import 'package:clean_architecture_rivaan_ranawat/features/group/domain/use_cases/get_group_recommendations_use_case.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/models/group_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_group_recommendations_event.dart';
part 'get_group_recommendations_state.dart';

class GetGroupRecommendationsBloc
    extends Bloc<GetGroupRecommendationsEvent, GetGroupRecommendationsState> {
  final GetGroupRecommendationsUseCase getGroupRecommendationsUseCase;

  GetGroupRecommendationsBloc({
    required this.getGroupRecommendationsUseCase,
  }) : super(GetGroupRecommendationsInitial()) {
    on<GetGroupRecommendations>((event, emit) async {
      emit(GetGroupRecommendationsLoading());

      final response = await getGroupRecommendationsUseCase(event.params);

      response.fold(
        (err) => emit(GetGroupRecommendationsError(message: err.message)),
        (res) => emit(GetGroupRecommendationsSuccess(recommendations: res)),
      );
    });
  }
}
