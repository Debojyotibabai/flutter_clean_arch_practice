import 'package:clean_architecture_rivaan_ranawat/features/recommendation_details/domain/entities/foods_for_particular_restaurant_entity.dart';
import 'package:clean_architecture_rivaan_ranawat/features/recommendation_details/domain/entities/recommendation_details_entity.dart';
import 'package:clean_architecture_rivaan_ranawat/features/recommendation_details/domain/use_cases/get_all_foods_for_particular_restaurant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'particular_restaurant_foods_event.dart';
part 'particular_restaurant_foods_state.dart';

class ParticularRestaurantFoodsBloc extends Bloc<ParticularRestaurantFoodsEvent,
    ParticularRestaurantFoodsState> {
  final GetAllFoodsForParticularRestaurantUseCase
      getAllFoodsForParticularRestaurantUseCase;

  ParticularRestaurantFoodsBloc({
    required this.getAllFoodsForParticularRestaurantUseCase,
  }) : super(ParticularRestaurantFoodsInitial()) {
    on<GetAllFoodsForParticularRestaurantEvent>(
      (event, emit) async {
        if (event.page == 1) {
          emit(ParticularRestaurantFoodsIsLoading());
        }

        List<FoodEntity>? previousFoods;

        if (state is ParticularRestaurantFoodsSuccess) {
          previousFoods =
              (state as ParticularRestaurantFoodsSuccess).foods.foods;
        }

        final response = await getAllFoodsForParticularRestaurantUseCase(
          Params(
            restaurantId: event.restaurantId,
            page: event.page,
            size: event.size,
          ),
        );

        response.fold(
          (err) {
            emit(ParticularRestaurantFoodsError(message: err.message));
          },
          (res) {
            if (event.page == 1) {
              emit(ParticularRestaurantFoodsSuccess(foods: res));
            } else {
              emit(ParticularRestaurantFoodsSuccess(
                  foods: (state as ParticularRestaurantFoodsSuccess)
                      .foods
                      .copyWith(
                foods: [...previousFoods!, ...res.foods!],
              )));
            }
          },
        );
      },
    );
  }
}
