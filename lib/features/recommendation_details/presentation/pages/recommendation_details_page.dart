import 'package:clean_architecture_rivaan_ranawat/features/recommendation_details/presentation/bloc/recommendation_details/recommendation_details_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/recommendation_details/presentation/widgets/recommendation_details_card.dart';
import 'package:clean_architecture_rivaan_ranawat/features/recommendation_details/presentation/widgets/tab_option.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/widgets/image_banner_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class RecommendationDetailsScreen extends StatefulWidget {
  const RecommendationDetailsScreen({
    super.key,
    required this.restaurantId,
  });

  final String restaurantId;

  @override
  State<RecommendationDetailsScreen> createState() =>
      _RecommendationDetailsScreenState();
}

class _RecommendationDetailsScreenState
    extends State<RecommendationDetailsScreen> {
  int selectedTab = 1;

  @override
  void initState() {
    BlocProvider.of<RecommendationDetailsBloc>(context).add(
      GetRecommendationDetailsEvent(restaurantId: widget.restaurantId),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
            BlocBuilder<RecommendationDetailsBloc, RecommendationDetailsState>(
          builder: (context, state) {
            if (state is RecommendationDetailsIsLoading) {
              return Center(
                child: SpinKitThreeInOut(
                  color: Colors.yellow[700],
                ),
              );
            } else if (state is RecommendationDetailsSuccess) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const ImageBannerScrollView(),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Taco Bell",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 25,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.phone,
                              size: 17,
                              color: Colors.red[900],
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "(801) 123-1234",
                              style: TextStyle(
                                color: Colors.red[900],
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_pin,
                              size: 17,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "571 N State St, Lindon, UT 84042",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      TabOption(
                        title: "Recommended",
                        selectedTab: selectedTab == 1,
                        onTap: () => setState(() => selectedTab = 1),
                      ),
                      TabOption(
                        title: "All Menu Items",
                        selectedTab: selectedTab == 2,
                        onTap: () => setState(() => selectedTab = 2),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: selectedTab == 1
                        ? ListView.builder(
                            itemCount: 5,
                            itemBuilder: (context, index) =>
                                RecommendationDetailsCard(index: index + 1),
                          )
                        : ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) =>
                                const RecommendationDetailsCard(),
                          ),
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
