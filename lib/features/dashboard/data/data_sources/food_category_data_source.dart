import 'dart:convert';
import 'dart:developer';

import 'package:clean_architecture_rivaan_ranawat/config/api_service.dart';
import 'package:clean_architecture_rivaan_ranawat/features/dashboard/data/models/food_category_model.dart';

abstract interface class FoodCategoryDataSource {
  Future<List<FoodCategoryModel>> getFoodCategory();
}

class FoodCategoryDataSourceImpl implements FoodCategoryDataSource {
  @override
  Future<List<FoodCategoryModel>> getFoodCategory() async {
    try {
      final response = await APIService.instance.request(
        "/restaurant-category/get-restaurant-categories?size=9999999",
        DioMethod.get,
      );

      return foodCategoryModelFromJson(
          json.encode(response.data["restaurantCategories"]));
    } catch (err) {
      log(err.toString());
      throw err.toString();
    }
  }
}
