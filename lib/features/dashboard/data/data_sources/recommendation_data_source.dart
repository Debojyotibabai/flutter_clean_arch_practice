import 'dart:developer';

import 'package:clean_architecture_rivaan_ranawat/config/api_service.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/data/models/recommendation_model.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/constants.dart';

abstract interface class RecommendationDataSource {
  Future<RecommendationModel> getRecommendation({
    required int page,
    required int size,
    required double latitude,
    required double longitude,
    required String unit,
    RecommendedFoodsSortByOption? sortByOption,
    String? restaurantCategoryIds,
  });

  Future<String> reportRecommendedFood({
    required String foodId,
    required String reportType,
  });
}

class RecommendationDataSourceImpl implements RecommendationDataSource {
  @override
  Future<RecommendationModel> getRecommendation({
    required int page,
    required int size,
    required double latitude,
    required double longitude,
    required String unit,
    RecommendedFoodsSortByOption? sortByOption,
    String? restaurantCategoryIds,
  }) async {
    try {
      const String url = "/food/get-recommended-foods";

      final Map<String, dynamic> param = {
        "page": page,
        "size": size,
        "latitude": latitude,
        "longitude": longitude,
        "unit": unit,
      };

      if (sortByOption != null) {
        param["order_by"] = sortByOption.value;
        param["order_type"] = sortByOption.order;
      }

      if (restaurantCategoryIds != null) {
        param["restaurantCategoryIds"] = restaurantCategoryIds;
      }

      final response = await APIService.instance.request(
        url,
        DioMethod.get,
        param: param,
      );

      final data = RecommendationModel.fromMap(response.data);

      return data;
    } catch (err, s) {
      log(err.toString() + s.toString());
      throw err.toString();
    }
  }

  @override
  Future<String> reportRecommendedFood({
    required String foodId,
    required String reportType,
  }) async {
    try {
      final response = await APIService.instance.request(
        "/food-report/save-food-report",
        DioMethod.post,
        param: {
          "food_id": foodId,
          "report_type": reportType,
        },
        contentType: ContentType.json,
      );

      return response.data["message"];
    } catch (err, s) {
      log(err.toString() + s.toString());
      throw err.toString();
    }
  }
}
