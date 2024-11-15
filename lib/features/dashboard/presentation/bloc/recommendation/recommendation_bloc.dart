import 'package:clean_architecture_rivaan_ranawat/features/dashboard/domain/use_cases/get_recommedation_use_case.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'recommendation_event.dart';
part 'recommendation_state.dart';

class RecommendationBloc
    extends Bloc<RecommendationEvent, RecommendationState> {
  final GetRecommedationUseCase getRecommedationUseCase;

  RecommendationBloc({required this.getRecommedationUseCase})
      : super(RecommendationInitial()) {
    on<GetRecommendationEvent>((event, emit) async {
      emit(RecommendationLoading());

      final response = await getRecommedationUseCase(Params(
        page: event.page,
        size: event.size,
        latitude: event.latitude,
        longitude: event.longitude,
        unit: event.unit,
        sortByOption: event.sortByOption,
        restaurantCategoryIds: event.restaurantCategoryIds,
      ));

      response.fold(
        (err) => emit(RecommendationError(message: err.message)),
        (res) => emit(RecommendationSuccess(recommendations: res)),
      );
    });
  }
}
