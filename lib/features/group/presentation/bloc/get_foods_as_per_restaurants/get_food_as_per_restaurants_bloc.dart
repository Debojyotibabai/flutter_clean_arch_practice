import 'package:clean_architecture_rivaan_ranawat/features/group/domain/entities/get_food_as_per_restaurants_entity.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/domain/use_cases/get_food_as_per_restaurants_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_food_as_per_restaurants_event.dart';
part 'get_food_as_per_restaurants_state.dart';

class GetFoodAsPerRestaurantsBloc
    extends Bloc<GetFoodAsPerRestaurantsEvent, GetFoodAsPerRestaurantsState> {
  final GetFoodAsPerRestaurantsUseCase getFoodAsPerRestaurantsUseCase;

  GetFoodAsPerRestaurantsBloc({
    required this.getFoodAsPerRestaurantsUseCase,
  }) : super(GetFoodAsPerRestaurantsInitial()) {
    on<GetFoodAsPerRestaurants>((event, emit) async {
      emit(GetFoodAsPerRestaurantsLoading());

      final response = await getFoodAsPerRestaurantsUseCase(
        GetFoodAsPerRestaurantsParams(
          restaurantIds: event.restaurantIds,
        ),
      );

      response.fold(
        (err) => emit(GetFoodAsPerRestaurantsError(message: err.message)),
        (res) => emit(GetFoodAsPerRestaurantsSuccess(recommendations: res)),
      );
    });
  }
}
