import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sample_app/core/models/register_model.dart';
import 'package:sample_app/core/services/auth_services.dart';
import 'package:sample_app/core/util/helpers.dart';

class RegistrationController extends GetxController {
  final _authAPi = Get.find<AuthService>();
  late final ImagePicker _imagePicker;
  late final ImageCropper _cropper;

  var profileImage = Rx<Uint8List?>(null);

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
    _imagePicker = ImagePicker();
    _cropper = ImageCropper();
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
      role: roleController.text,
      base64ImageUrl: profileImage.value == null
          ? ""
          : base64String(profileImage.value!),
    );

    showSaveProgress.value = true;
    var result = await _authAPi.registerUser(registerModel);
    if (result.isSuccess) {
      showSnackBar1("Success", result.errorMessages!.toString(),
          type: SnackBarType.success);
    } else {
      showSnackBar1("Failed", result.errorMessages.toString());
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

  void getImage(ImageSource imageSource, Rx<Uint8List?> image) async {
    final selectImageFile = await _imagePicker.pickImage(source: imageSource);
    if (selectImageFile != null) {
      CroppedFile? croppedFile = await _cropper.cropImage(
        sourcePath: selectImageFile.path,
        aspectRatio: imageCropAspectRatio,
        maxHeight: 512,
        maxWidth: 512,
        uiSettings: [
          imageCropAndroidUISettings,
          imageCropIosUISettings,
        ],
      );
      image.value = File(croppedFile!.path).readAsBytesSync();
    } else {
      showSnackBar1('Error', 'No Image Selected');
    }
  }
}
