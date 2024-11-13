// ignore_for_file: avoid_print

import 'package:clean_architecture_rivaan_ranawat/config/api_service.dart';

abstract interface class AuthDataSource {
  Future<String> loginWithEmailPassword({
    required String email,
    required String password,
  });
}

class AuthDataSourceImpl implements AuthDataSource {
  @override
  Future<String> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await APIService.instance.request(
        "/auth/login",
        DioMethod.post,
        param: {
          "emailAddress": email,
          "password": password,
          "userType": "Customer",
        },
        contentType: ContentType.json,
      );

      return response.data["tokens"]["accessToken"];
    } catch (e) {
      throw e.toString();
    }
  }
}
