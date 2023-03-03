import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app/core/models/register_model.dart';
import 'package:sample_app/core/services/auth_services.dart';
import 'package:sample_app/core/util/helpers.dart';

class RegistrationController extends GetxController {

  final _authAPi =Get.find<AuthService>();

  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController roleController;

  var passwordShow = false.obs;
  var conformPasswordShow = false.obs;
  var showSaveProgress = false.obs;

  @override
  void onInit() {
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    roleController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    roleController.dispose();
    super.onClose();
  }

  Future<void> registerUser() async {
    if (!validateUser()) return;
    var registerModel = RegisterPostModel(
        userName: usernameController.text,
        email: emailController.text,
        password: passwordController.text,
        role: roleController.text);

    showSaveProgress.value = true;
    var result =await _authAPi.registerUser(registerModel);
    if(result.isSuccess){
      showSnackBar1("Success", result.errorMessages!.toString(), type: SnackBarType.success);
    }else{
      showSnackBar1("Failed", result.errorMessages!.toString());
    }
    showSaveProgress.value = false;
  }

  bool validateUser() {
    if (usernameController.text.isEmpty) {
      showSnackBar1("Error", "Enter User name");
      return false;
    }
    if (emailController.text.isEmpty) {
      showSnackBar1("Error", "Enter Email Address");
      return false;
    }
    if (passwordController.text.isEmpty) {
      showSnackBar1("Error", "Enter Password");
      return false;
    }

    if (confirmPasswordController.text.isEmpty) {
      showSnackBar1("Error", "Enter ConfirmPassword");
      return false;
    }
    if (confirmPasswordController.text != passwordController.text) {
      showSnackBar1("Error", "ConfirmPassword or Password Not match");
      return false;
    }
    return true;
  }
}
