import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app/core/controllers/auth_controller.dart';
import 'package:sample_app/core/models/login_model.dart';
import 'package:sample_app/core/services/auth_services.dart';
import 'package:sample_app/core/services/shared_pref_service.dart';
import 'package:sample_app/core/util/helpers.dart';

class LoginController extends GetxController {
  final _sharedService = Get.find<SharedPrefService>();
  final _authService = Get.find<AuthService>();
  final _authController=Get.find<AuthController>();
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  var passwordShow = false.obs;
  var showSaveProgress = false.obs;

  @override
  void onInit() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> loginUser() async {
    if (!validateUser()) return;
    var loginModel = LoginRequestModel(
        userName: usernameController.text, password: passwordController.text);

    showSaveProgress.value = true;
    var result = await _authService.loginUser(loginModel);
    if (result.isSuccess) {
      _sharedService.storeAuthToken(result.result!.token);
      _authController.loggedIn.value = true;
    } else {
      showSnackBar1("Failed", result.errorMessages!.toString());
    }
    showSaveProgress.value = false;
  }

  bool validateUser() {
    if (usernameController.text.isEmpty) {
      showSnackBar1("Error", "Enter User name");
      return false;
    }

    if (passwordController.text.isEmpty) {
      showSnackBar1("Error", "Enter Password");
      return false;
    }
    return true;
  }
}
