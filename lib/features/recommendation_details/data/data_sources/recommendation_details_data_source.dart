import 'dart:developer';

import 'package:clean_architecture_rivaan_ranawat/config/api_service.dart';

abstract interface class RecommendationDetailsDataSource {
  Future<String> getRecommendationDetails();
}

class RecommendationDetailsDataSourceImpl
    implements RecommendationDetailsDataSource {
  @override
  Future<String> getRecommendationDetails() async {
    try {
      final response = await APIService.instance.request(
        "/restaurant/get-restaurant-location-details/0c8a7c87-6432-4848-9ea5-896305fbb5e4",
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
