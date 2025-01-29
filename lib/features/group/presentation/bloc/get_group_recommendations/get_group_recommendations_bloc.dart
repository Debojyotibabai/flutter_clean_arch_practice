import 'package:clean_architecture_rivaan_ranawat/features/group/domain/entities/get_food_as_per_restaurants_entity.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/domain/entities/get_group_recommendations_entity.dart';
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
    on<GetGroupRecommendations>(
      (event, emit) async {
        if (event.params.page <= 1) {
          emit(GetGroupRecommendationsLoading());
        }

        GetGroupRecommendationsEntity? previousRecommendations;

        if (state is GetGroupRecommendationsSuccess) {
          previousRecommendations =
              (state as GetGroupRecommendationsSuccess).recommendations;
        }

        final response = await getGroupRecommendationsUseCase(event.params);

        response.fold(
          (err) => emit(GetGroupRecommendationsError(message: err.message)),
          (res) {
            if (event.params.page <= 1) {
              emit(GetGroupRecommendationsSuccess(recommendations: res));
            } else {
              final List<RestaurantRecommendationEntity>
                  restaurantRecommendations = [
                ...previousRecommendations!.restaurantRecommendations!,
                ...res.restaurantRecommendations!
              ];

              emit(
                GetGroupRecommendationsSuccess(
                  recommendations: res.copyWith(
                    pagination: res.pagination,
                    restaurantRecommendations: restaurantRecommendations,
                  ),
                ),
              );
            }
          },
        );
      },
    );

    on<AttachFoodToRecommendations>(
      (event, emit) async {
        List<RestaurantRecommendationEntity> restaurantRecommendations =
            (state as GetGroupRecommendationsSuccess)
                .recommendations
                .restaurantRecommendations!;

        if (restaurantRecommendations.isEmpty) {
          return;
        }

        final updateRestaurantRecommendations =
            restaurantRecommendations.map((item) {
          return item.copyWith(
              recommendation: event.recommendations.recommendations!.firstWhere(
                  (element) => element.restaurantId == item.restaurantId));
        }).toList();

        emit(GetGroupRecommendationsSuccess(
            recommendations: (state as GetGroupRecommendationsSuccess)
                .recommendations
                .copyWith(
                    restaurantRecommendations:
                        updateRestaurantRecommendations)));
      },
    );
  }
}
