import 'package:clean_architecture_rivaan_ranawat/features/recommendation_details/domain/entities/recommendation_details_entity.dart';
import 'package:clean_architecture_rivaan_ranawat/features/recommendation_details/domain/use_cases/get_recommendation_details_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'recommendation_details_event.dart';
part 'recommendation_details_state.dart';

class RecommendationDetailsBloc
    extends Bloc<RecommendationDetailsEvent, RecommendationDetailsState> {
  final GetRecommendationDetailsUseCase getRecommendationDetailsUseCase;

  RecommendationDetailsBloc({
    required this.getRecommendationDetailsUseCase,
  }) : super(RecommendationDetailsInitial()) {
    on<GetRecommendationDetailsEvent>(
      (event, emit) async {
        emit(RecommendationDetailsIsLoading());

        final response = await getRecommendationDetailsUseCase(Params(
          restaurantId: event.restaurantId,
        ));

        response.fold(
          (err) => emit(
            RecommendationDetailsFailure(
              message: err.message,
            ),
          ),
          (res) => emit(
            RecommendationDetailsSuccess(recommendationDetails: res),
          ),
        );
      },
    );
  }
}
