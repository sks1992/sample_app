import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sample_app/app_route.dart';
import 'package:sample_app/core/util/helpers.dart';
import 'package:sample_app/ui/widgets/reusable_text_field.dart';

import '../../core/controllers/registration_controller.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({Key? key}) : super(key: key);
  final controller = Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Obx(
                    () => controller.profileImage.value == null
                        ? const CircleAvatar(
                            radius: 64,
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage("assets/images/no_image.png"),
                          )
                        : CircleAvatar(
                            radius: 64,
                            backgroundColor: Colors.white,
                            backgroundImage:
                                MemoryImage(controller.profileImage.value!),
                          ),
                  ),
                  Positioned(
                    bottom: -10,
                    right: -10,
                    child: IconButton(
                      onPressed: () {
                        Get.dialog(
                          AlertDialog(
                            title: const Text("Choose"),
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: Get.height * 0.1,
                                  child: InkWell(
                                    onTap: () {
                                      controller.getImage(ImageSource.camera,
                                          controller.profileImage);
                                      Get.back();
                                    },
                                    child: Column(
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.all(4.0),
                                          child: Icon(
                                            Icons.photo_camera,
                                            color: Colors.grey,
                                            size: 35,
                                          ),
                                        ),
                                        Text(
                                          "Camera",
                                          style: TextStyle(color: Colors.grey),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: Get.height * 0.1,
                                  child: InkWell(
                                    onTap: () {
                                      controller.getImage(ImageSource.gallery,
                                          controller.profileImage);
                                      Get.back();
                                      Get.back();
                                    },
                                    child: Column(
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.all(4.0),
                                          child: Icon(
                                            Icons.image,
                                            color: Colors.grey,
                                            size: 35,
                                          ),
                                        ),
                                        Text(
                                          "Gallery",
                                          style: TextStyle(color: Colors.grey),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: const Text(
                                    "CLOSE",
                                    style: TextStyle(color: Colors.black),
                                  ))
                            ],
                          ),
                        );
                      },
                      icon: const Icon(Icons.camera_alt),
                    ),
                  ),
                ],
              ),
              ReusableTextField(
                labelText: "User Name",
                controller: controller.usernameController,
                prefixIcon: const Icon(Icons.person),
              ),
              ReusableTextField(
                labelText: "Email",
                controller: controller.emailController,
                textInputType: TextInputType.emailAddress,
                prefixIcon: const Icon(Icons.email),
              ),
              Obx(
                () => ReusableTextField(
                  labelText: "Password",
                  controller: controller.passwordController,
                  obscureText: controller.passwordShow.value ? false : true,
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.passwordShow.value =
                          !controller.passwordShow.value;
                    },
                    icon: controller.passwordShow.value
                        ? const Icon(
                            Icons.remove_red_eye_outlined,
                            color: Colors.red,
                          )
                        : const Icon(
                            Icons.remove_red_eye,
                            color: Colors.black54,
                          ),
                  ),
                  prefixIcon: const Icon(Icons.lock),
                ),
              ),
              Obx(
                () => ReusableTextField(
                  labelText: "Confirm Password",
                  controller: controller.confirmPasswordController,
                  obscureText:
                      controller.conformPasswordShow.value ? false : true,
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.conformPasswordShow.value =
                          !controller.conformPasswordShow.value;
                    },
                    icon: controller.conformPasswordShow.value
                        ? const Icon(
                            Icons.remove_red_eye_outlined,
                            color: Colors.red,
                          )
                        : const Icon(
                            Icons.remove_red_eye,
                            color: Colors.black54,
                          ),
                  ),
                  prefixIcon: const Icon(Icons.lock),
                ),
              ),
              ReusableTextField(
                labelText: "Role",
                controller: controller.roleController,
                prefixIcon: const Icon(Icons.person),
              ),
              InkWell(
                onTap: () async {
                  hideKeyboard();
                  await controller.registerUser();
                },
                child: Obx(
                  () => Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        color: Colors.indigoAccent),
                    child: controller.showSaveProgress.value
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text(
                            "Register",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child:
                        const Text("Already Have An Registered Account.Go To "),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.offNamed(RouteNames.login);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
