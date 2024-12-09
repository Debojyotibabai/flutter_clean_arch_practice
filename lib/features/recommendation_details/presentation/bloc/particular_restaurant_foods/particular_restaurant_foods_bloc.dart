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
    on<GetAllFoodsForParticularRestaurantEvent>((event, emit) async {
      emit(ParticularRestaurantFoodsIsLoading());

      final response = await getAllFoodsForParticularRestaurantUseCase(Params(
        restaurantId: event.restaurantId,
        page: event.page,
        size: event.size,
      ));

      response.fold((err) {
        emit(ParticularRestaurantFoodsError(message: err.message));
      }, (res) {
        emit(ParticularRestaurantFoodsSuccess(foods: res));
      });
    });
  }
}
