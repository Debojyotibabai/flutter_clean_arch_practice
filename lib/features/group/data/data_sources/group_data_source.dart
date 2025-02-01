import 'dart:convert';
import 'dart:developer';

import 'package:clean_architecture_rivaan_ranawat/config/api_service.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/data/models/get_all_groups_model.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/data/models/get_food_as_per_restaurants_model.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/data/models/get_group_details_model.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/data/models/get_group_participants_model.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/data/models/get_group_recommendations_model.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/models/group_model.dart';

abstract class GroupDataSource {
  Future<GetAllGroupsModel> getAllGroups(GetAllGroupsParams params);

  Future<GetGroupDetailsModel> getGroupDetails({required String groupId});

  Future<String> updateGroupDetails({
    required UpdateGroupDetailsParams params,
  });

  Future<GetGroupRecommendationsModel> getGroupRecommendations({
    required GetGroupRecommendationsParams params,
  });

  Future<String> deleteGroup({required String groupId});

  Future<GetFoodAsPerRestaurantsModel> getFoodAsPerRestaurants(
      List<String> restaurantIds);

  Future<GetGroupParticipantsModel> getGroupParticipants(
      {required String groupId});
}

class GroupDataSourceImpl implements GroupDataSource {
  @override
  Future<GetAllGroupsModel> getAllGroups(GetAllGroupsParams params) async {
    try {
      final response = await APIService.instance.request(
        "/group/get-my-groups",
        DioMethod.get,
        param: {
          "page": params.page,
          "size": params.size,
        },
      );

      final data = getAllGroupsModelFromMap(json.encode(response.data));

      return data;
    } catch (err, s) {
      log(err.toString() + s.toString());
      throw err.toString();
    }
  }

  @override
  Future<GetGroupDetailsModel> getGroupDetails(
      {required String groupId}) async {
    try {
      final response = await APIService.instance.request(
        "/group/get-group-details/$groupId",
        DioMethod.get,
      );

      return getGroupDetailsModelFromMap(json.encode(response.data["group"]));
    } catch (err, s) {
      log(err.toString() + s.toString());
      throw err.toString();
    }
  }

  @override
  Future<String> updateGroupDetails({
    required UpdateGroupDetailsParams params,
  }) async {
    try {
      final response = await APIService.instance.request(
        "/group/update-group/${params.groupId}",
        DioMethod.patch,
        formData: {
          "groupName": params.groupName,
          "city": params.city,
          "state": params.state,
        },
        contentType: ContentType.json,
      );

      return response.data["message"];
    } catch (err, s) {
      log(err.toString() + s.toString());
      throw err.toString();
    }
  }

  @override
  Future<GetGroupRecommendationsModel> getGroupRecommendations({
    required GetGroupRecommendationsParams params,
  }) async {
    try {
      Map<String, dynamic> param = {
        "latitude": params.latitude,
        "longitude": params.longitude,
        "unit": params.unit,
        "page": params.page,
        "size": params.size,
      };

      if (params.sortBy != null) {
        param["sortBy"] = params.sortBy!.value;
      }
      if (params.restaurantCategoryIds != null) {
        param["restaurantCategoryIds"] =
            params.restaurantCategoryIds!.restaurantCategoryId;
      }

      final response = await APIService.instance.request(
        "/group/get-restaurant-recommendations/${params.groupId}",
        DioMethod.get,
        param: param,
      );

      final data =
          getGroupRecommendationsModelFromMap(json.encode(response.data));

      return data;
    } catch (err, s) {
      log(err.toString() + s.toString());
      throw err.toString();
    }
  }

  @override
  Future<String> deleteGroup({required String groupId}) async {
    try {
      final response = await APIService.instance.request(
        "/group/delete-group/$groupId",
        DioMethod.delete,
      );

      return response.data["message"];
    } catch (err, s) {
      log(err.toString() + s.toString());
      throw err.toString();
    }
  }

  @override
  Future<GetFoodAsPerRestaurantsModel> getFoodAsPerRestaurants(
      List<String> restaurantIds) async {
    try {
      final response = await APIService.instance.request(
        "/group/fetch-restaurant-wise-recommendations",
        DioMethod.get,
        param: {
          "restaurant_ids": restaurantIds,
        },
      );

      final data =
          getFoodAsPerRestaurantsModelFromMap(json.encode(response.data));

      return data;
    } catch (err, s) {
      log(err.toString() + s.toString());
      throw err.toString();
    }
  }

  @override
  Future<GetGroupParticipantsModel> getGroupParticipants(
      {required String groupId}) async {
    try {
      final response = await APIService.instance.request(
        "/group/get-group-members/$groupId",
        DioMethod.get,
      );

      return getGroupParticipantsModelFromMap(json.encode(response.data));
    } catch (err, s) {
      log(err.toString() + s.toString());
      throw err.toString();
    }
  }
}
