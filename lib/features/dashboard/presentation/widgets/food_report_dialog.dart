import 'package:clean_architecture_rivaan_ranawat/features/dashboard/presentation/bloc/recommendation/recommendation_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/presentation/bloc/report_recommendation/report_recommendation_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/init_dependencies.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/widgets/dialog/success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FoodReportDialog extends StatelessWidget {
  FoodReportDialog({super.key, required this.id});

  final String id;

  final List<String> buttonContent = [
    "I Don't Like It",
    "Tried It Too Many Times",
    "Not An Entree",
  ];

  void reportFood({required String reportType}) {
    serviceLocator<ReportRecommendationBloc>().add(ReportRecommendedFoodEvent(
      foodId: id,
      reportType: reportType,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child:
            BlocConsumer<ReportRecommendationBloc, ReportRecommendationState>(
          listener: (context, state) {
            if (state is ReportRecommendationSuccess) {
              BlocProvider.of<RecommendationBloc>(context)
                  .add(UpdateRecommendationEvent(id: id));
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return SuccessDialog(message: state.message);
                },
              );
            } else if (state is ReportRecommendationError) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is ReportRecommendationLoading) {
              return SizedBox(
                height: 200,
                child: Center(
                  child: SpinKitThreeInOut(
                    color: Colors.yellow[700],
                  ),
                ),
              );
            }
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Why do you want to hide this item?",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 5),
                ...buttonContent.map(
                  (item) {
                    return Column(
                      children: [
                        const SizedBox(height: 15),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              reportFood(reportType: item);
                            },
                            style: ButtonStyle(
                              shape: WidgetStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              backgroundColor: WidgetStateProperty.all<Color>(
                                Colors.grey[100]!,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
