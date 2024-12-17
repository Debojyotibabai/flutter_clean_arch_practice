import 'dart:developer';

import 'package:clean_architecture_rivaan_ranawat/config/api_service.dart';
import 'package:clean_architecture_rivaan_ranawat/features/edit_profile/data/models/edit_profile_data_model.dart';

abstract class EditProfileDataSource {
  Future<EditProfileDataModel> getEditProfileData();
}

class EditProfileDataSourceImpl extends EditProfileDataSource {
  @override
  Future<EditProfileDataModel> getEditProfileData() async {
    try {
      final response = await APIService.instance.request(
        "/auth/me",
        DioMethod.get,
      );

      final data = EditProfileDataModel.fromMap(response.data);

      return data;
    } catch (err, s) {
      log(err.toString() + s.toString());

      throw err.toString();
    }
  }
}
