import 'dart:developer';

import 'package:clean_architecture_rivaan_ranawat/config/api_service.dart';

abstract interface class RecommendationDetailsDataSource {
  Future<String> getRecommendationDetails({
    required String restaurantId,
  });
}

class RecommendationDetailsDataSourceImpl
    implements RecommendationDetailsDataSource {
  @override
  Future<String> getRecommendationDetails({
    required String restaurantId,
  }) async {
    try {
      final response = await APIService.instance.request(
        "/restaurant/get-restaurant-location-details/$restaurantId",
        DioMethod.get,
      );

      log(response.toString());

      return "";
    } catch (e, s) {
      log(e.toString() + s.toString());
      throw e.toString();
    }
  }
}
