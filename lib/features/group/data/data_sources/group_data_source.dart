import 'dart:convert';
import 'dart:developer';

import 'package:clean_architecture_rivaan_ranawat/config/api_service.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/data/models/get_all_groups_model.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/models/group_model.dart';

abstract class GroupDataSource {
  Future<GetAllGroupsModel> getAllGroups(GetAllGroupsParams params);
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
}
