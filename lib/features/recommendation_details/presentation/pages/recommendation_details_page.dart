import 'package:clean_architecture_rivaan_ranawat/features/recommendation_details/presentation/bloc/particular_restaurant_foods/particular_restaurant_foods_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/recommendation_details/presentation/bloc/recommendation_details/recommendation_details_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/recommendation_details/presentation/widgets/recommendation_details_card.dart';
import 'package:clean_architecture_rivaan_ranawat/features/recommendation_details/presentation/widgets/tab_option.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/widgets/image_banner_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

class RecommendationDetailsScreen extends StatefulWidget {
  const RecommendationDetailsScreen({
    super.key,
    required this.restaurantId,
    required this.restaurantAddressId,
  });

  final String restaurantId;
  final String restaurantAddressId;

  @override
  State<RecommendationDetailsScreen> createState() =>
      _RecommendationDetailsScreenState();
}

class _RecommendationDetailsScreenState
    extends State<RecommendationDetailsScreen> {
  int selectedTab = 1;

  int page = 1;
  int size = 10;

  ScrollController scrollController = ScrollController();
  bool isLoadingFoodsForParticularRestaurant = false;

  void getAllFoodsForParticularRestaurant() {
    BlocProvider.of<ParticularRestaurantFoodsBloc>(context).add(
      GetAllFoodsForParticularRestaurantEvent(
        restaurantId: widget.restaurantId,
        page: page,
        size: size,
      ),
    );
  }

  @override
  void initState() {
    BlocProvider.of<RecommendationDetailsBloc>(context).add(
      GetRecommendationDetailsEvent(
        restaurantAddressId: widget.restaurantAddressId,
      ),
    );

    getAllFoodsForParticularRestaurant();

    scrollController.addListener(() {
      if (isLoadingFoodsForParticularRestaurant) return;

      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        setState(() {
          isLoadingFoodsForParticularRestaurant = true;
        });

        page++;

        getAllFoodsForParticularRestaurant();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 29,
            color: Colors.white,
          ),
          onPressed: () => context.pop(),
        ),
      ),
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
                        Text(
                          state.recommendationDetails.restaurantName!,
                          style: const TextStyle(
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
                              "${state.recommendationDetails.restaurantLocationDetails!.phoneCountryCode!} ${state.recommendationDetails.restaurantLocationDetails!.phoneNumber!}",
                              style: TextStyle(
                                color: Colors.red[900],
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.location_pin,
                              size: 17,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                "${state.recommendationDetails.restaurantLocationDetails!.streetAddress!}, ${state.recommendationDetails.restaurantLocationDetails!.city!}, ${state.recommendationDetails.restaurantLocationDetails!.state!}, ${state.recommendationDetails.restaurantLocationDetails!.country!}",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
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
                                RecommendationDetailsCard(
                              index: index + 1,
                              foodName: state
                                  .recommendationDetails
                                  .restaurantLocationDetails!
                                  .foods![index]
                                  .foodItemName,
                              rating: state
                                      .recommendationDetails
                                      .restaurantLocationDetails!
                                      .foods![index]
                                      .givenPercentage ??
                                  state
                                      .recommendationDetails
                                      .restaurantLocationDetails!
                                      .foods![index]
                                      .matchPercentage,
                              price: state
                                  .recommendationDetails
                                  .restaurantLocationDetails!
                                  .foods![index]
                                  .price,
                            ),
                          )
                        : BlocConsumer<ParticularRestaurantFoodsBloc,
                            ParticularRestaurantFoodsState>(
                            listener: (context, state) {
                              if (state is ParticularRestaurantFoodsSuccess) {
                                setState(() {
                                  isLoadingFoodsForParticularRestaurant = false;
                                });
                              }
                            },
                            builder: (context, state) {
                              if (state is ParticularRestaurantFoodsIsLoading) {
                                return SpinKitThreeInOut(
                                  color: Colors.yellow[700],
                                );
                              }
                              if (state is ParticularRestaurantFoodsSuccess) {
                                return ListView.builder(
                                  controller: scrollController,
                                  itemCount: state.foods.foods?.length,
                                  itemBuilder: (context, index) =>
                                      RecommendationDetailsCard(
                                    foodName:
                                        state.foods.foods![index].foodItemName,
                                    rating: state.foods.foods![index]
                                            .givenPercentage ??
                                        state.foods.foods![index]
                                            .matchPercentage,
                                    price: state.foods.foods![index].price,
                                  ),
                                );
                              }
                              return Container();
                            },
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
