import 'package:clean_architecture_rivaan_ranawat/features/dashboard/domain/entities/recommendation_entity.dart';
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
    on<GetRecommendationEvent>(
      (event, emit) async {
        if (event.page == 1) {
          emit(RecommendationLoading());
        }

        List<RecommendedFoodEntity>? previousRecommendedFoods;

        if (state is RecommendationSuccess) {
          previousRecommendedFoods =
              (state as RecommendationSuccess).recommendations.recommendedFoods;
        }

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
          (res) {
            if (event.page == 1) {
              emit(RecommendationSuccess(recommendations: res));
            } else if (event.page > 1 && state is RecommendationSuccess) {
              final updatedRecommendedFoods = [
                ...previousRecommendedFoods!,
                ...res.recommendedFoods!
              ];

              emit(RecommendationSuccess(
                recommendations:
                    res.copyWith(recommendedFoods: updatedRecommendedFoods),
              ));
            }
          },
        );
      },
    );

    on<UpdateIsReportFoodOptionAvailabilityEvent>(
      (event, emit) {
        final updatedRecommendedFoods = (state as RecommendationSuccess)
            .recommendations
            .recommendedFoods
            ?.map((item) {
          if (item.id == event.id) {
            return item.copyWith(
              isReportFoodOptionVisible: !item.isReportFoodOptionVisible!,
            );
          }
          return item.copyWith(
            isReportFoodOptionVisible: false,
          );
        });

        emit(
          RecommendationSuccess(
            recommendations:
                (state as RecommendationSuccess).recommendations.copyWith(
                      recommendedFoods: updatedRecommendedFoods?.toList(),
                    ),
          ),
        );
      },
    );

    on<UpdateRecommendationEvent>(
      (event, emit) {
        final updatedRecommendedFoods = (state as RecommendationSuccess)
            .recommendations
            .recommendedFoods
            ?.where((food) => food.id != event.id)
            .toList();

        emit(
          RecommendationSuccess(
            recommendations: (state as RecommendationSuccess)
                .recommendations
                .copyWith(recommendedFoods: updatedRecommendedFoods),
          ),
        );
      },
    );
  }
}
