import 'dart:developer';

import 'package:clean_architecture_rivaan_ranawat/config/api_service.dart';

abstract class EditProfileDataSource {
  Future<String> getEditProfileData();
}

class EditProfileDataSourceImpl extends EditProfileDataSource {
  @override
  Future<String> getEditProfileData() async {
    try {
      final response = await APIService.instance.request(
        "/auth/me",
        DioMethod.get,
      );
      log(response.toString());

      return "";
    } catch (err, s) {
      log(err.toString() + s.toString());

      throw err.toString();
    }
  }
}
