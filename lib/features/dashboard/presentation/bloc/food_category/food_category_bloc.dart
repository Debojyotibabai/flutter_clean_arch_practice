import 'package:clean_architecture_rivaan_ranawat/features/dashboard/domain/entities/food_category_entity.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/domain/use_cases/get_food_category_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'food_category_event.dart';
part 'food_category_state.dart';

class FoodCategoryBloc extends Bloc<FoodCategoryEvent, FoodCategoryState> {
  final GetFoodCategoryUseCase getFoodCategoryUseCase;

  FoodCategoryBloc({required this.getFoodCategoryUseCase})
      : super(GetFoodCategoryInitial()) {
    on<FoodCategoryEvent>((event, emit) async {
      emit(GetFoodCategoryLoading());

      final response = await getFoodCategoryUseCase(NoParams());

      response.fold(
        (err) => emit(GetFoodCategoryError(error: err.toString())),
        (res) => emit(GetFoodCategorySuccess(foodCategory: res)),
      );
    });
  }
}
