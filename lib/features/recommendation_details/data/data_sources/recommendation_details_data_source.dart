import 'dart:developer';

import 'package:clean_architecture_rivaan_ranawat/config/api_service.dart';
import 'package:clean_architecture_rivaan_ranawat/features/recommendation_details/data/models/recommendation_details_model.dart';

abstract interface class RecommendationDetailsDataSource {
  Future<RecommendationDetailsModel> getRecommendationDetails({
    required String restaurantAddressId,
  });

  Future<String> getAllFoodsForParticularRestaurant({
    required String restaurantId,
    required int page,
    required int size,
  });
}

class RecommendationDetailsDataSourceImpl
    implements RecommendationDetailsDataSource {
  @override
  Future<RecommendationDetailsModel> getRecommendationDetails({
    required String restaurantAddressId,
  }) async {
    try {
      final response = await APIService.instance.request(
        "/restaurant/get-restaurant-location-details/$restaurantAddressId",
        DioMethod.get,
      );

      final data = RecommendationDetailsModel.fromMap((response.data));

      return data;
    } catch (e, s) {
      log(e.toString() + s.toString());
      throw e.toString();
    }
  }

  @override
  Future<String> getAllFoodsForParticularRestaurant({
    required String restaurantId,
    required int page,
    required int size,
  }) async {
    try {
      final response = await APIService.instance.request(
        "/food/get-restaurant-foods/$restaurantId",
        DioMethod.get,
        param: {
          "page": page,
          "size": size,
        },
      );

      log(response.data);

      return "";
    } catch (e, s) {
      log(e.toString() + s.toString());
      throw e.toString();
    }
  }
}
