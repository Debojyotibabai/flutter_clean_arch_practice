import 'package:clean_architecture_rivaan_ranawat/features/dashboard/domain/use_cases/report_recommended_food_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'report_recommendation_event.dart';
part 'report_recommendation_state.dart';

class ReportRecommendationBloc
    extends Bloc<ReportRecommendationEvent, ReportRecommendationState> {
  final ReportRecommendedFoodUseCase reportRecommendedFoodUseCase;

  ReportRecommendationBloc({required this.reportRecommendedFoodUseCase})
      : super(ReportRecommendationInitial()) {
    on<ReportRecommendedFoodEvent>(
      (event, emit) async {
        emit(ReportRecommendationLoading());

        final response = await reportRecommendedFoodUseCase(
          Params(
            foodId: event.foodId,
            reportType: event.reportType,
          ),
        );

        response.fold(
          (err) => emit(ReportRecommendationError(message: err.message)),
          (res) => emit(ReportRecommendationSuccess(message: res)),
        );
      },
    );
  }
}
