import 'dart:developer';

import 'package:clean_architecture_rivaan_ranawat/config/api_service.dart';
import 'package:clean_architecture_rivaan_ranawat/features/edit_profile/data/models/edit_profile_data_model.dart';
import 'package:dio/dio.dart';
import 'package:mime/mime.dart';

abstract class EditProfileDataSource {
  Future<EditProfileDataModel> getEditProfileData();

  Future<String> editProfile({
    required String? profilePicture,
    required String? firstName,
    required String? lastName,
    required String? emailAddress,
    required String? phoneCountryCode,
    required String? phoneNumber,
  });
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

  @override
  Future<String> editProfile({
    required String? profilePicture,
    required String? firstName,
    required String? lastName,
    required String? emailAddress,
    required String? phoneCountryCode,
    required String? phoneNumber,
  }) async {
    final formData = FormData.fromMap({
      if (!(profilePicture!.startsWith('http://') ||
          profilePicture.startsWith('https://')))
        'profilePicture': await MultipartFile.fromFile(
          profilePicture,
          filename: profilePicture.split('/').last,
          contentType: DioMediaType.parse(
            lookupMimeType(profilePicture) ?? 'application/octet-stream',
          ),
        ),
      "firstName": firstName,
      "lastName": lastName,
      "emailAddress": emailAddress,
      "phoneCountryCode": phoneCountryCode,
      "phoneNumber": phoneNumber,
    });

    try {
      final response = await APIService.instance.request(
        "/auth/update-profile",
        DioMethod.patch,
        contentType: ContentType.multiPartFormData,
        formData: formData,
      );

      return response.data["message"];
    } catch (err, s) {
      log(err.toString() + s.toString());
      throw err.toString();
    }
  }
}
