import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sample_app/core/models/login_model.dart';
import 'package:sample_app/core/models/register_model.dart';
import 'package:sample_app/core/services/url_services.dart';

class AuthService extends GetConnect {
  final _urlService = Get.find<UrlServices>();

  @override
  void onInit() {
    httpClient.baseUrl = _urlService.getApiBaseUrl();
    httpClient.timeout = const Duration(minutes: 1);
    httpClient.addResponseModifier((request, response) async {
      if (kDebugMode) {
        print(response.bodyString);
      }
      return response;
    });
    httpClient.addAuthenticator<void>((request) async {
      request.headers['Content-type'] = "application/json";
      return request;
    });
    super.onInit();
  }

  Future<RegisterResultModel> registerUser(RegisterPostModel model) async {
    final response = await post("/auth/registration", model.toJson());
    if (response.hasError) {
      return RegisterResultModel(isSuccess: false);
    }
    return RegisterResultModel.fromJson(json.decode(response.bodyString!));
  }

  Future<LoginResultModel> loginUser(LoginRequestModel model) async {
    var response = await post("/auth/login", model.toJson());
    if (response.hasError) {
      return LoginResultModel(isSuccess: false);
    }
    return LoginResultModel.fromJson(json.decode(response.bodyString!));
  }
}
