import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';

void hideKeyboard() {
  WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
}

enum SnackBarType { info, error, success }

void showSnackBar1(String title, String message,
    {SnackBarType type = SnackBarType.info, Function? onOkClick}) {
  Color bgColor = Colors.red;
  Color textColor = Colors.white;
  Color buttonColor = Colors.white;

  switch (type) {
    case SnackBarType.info:
      break;
    case SnackBarType.error:
      bgColor = Colors.red;
      textColor = Colors.white;
      buttonColor = textColor;
      break;
    case SnackBarType.success:
      bgColor = Colors.green;
      textColor = Colors.white;
      buttonColor = textColor;
      break;
  }

  Get.snackbar(
    title,
    message,
    backgroundColor: bgColor,
    colorText: textColor,
    snackPosition: SnackPosition.BOTTOM,
    borderRadius: 0,
    duration: const Duration(seconds: 10),
    animationDuration: const Duration(milliseconds: 650),
    mainButton: TextButton(
      onPressed: () async {
        if (onOkClick != null) {
          await onOkClick();
          Get.closeAllSnackbars();
        } else {
          Get.closeAllSnackbars();
        }
      },
      child: Text(
        "OK",
        style: TextStyle(color: buttonColor),
      ),
    ),
  );
}

CropAspectRatio get imageCropAspectRatio =>
    const CropAspectRatio(ratioX: 1.0, ratioY: 1.0);

AndroidUiSettings get imageCropAndroidUISettings => AndroidUiSettings(
    toolbarTitle: 'Crop Image',
    toolbarColor: Colors.white,
    toolbarWidgetColor: Colors.black87,
    initAspectRatio: CropAspectRatioPreset.original,
    lockAspectRatio: false);

IOSUiSettings get imageCropIosUISettings => IOSUiSettings(
      title: 'Crop Image',
      minimumAspectRatio: 1.0,
    );

String base64String(Uint8List data) {
  return base64Encode(data);
}
