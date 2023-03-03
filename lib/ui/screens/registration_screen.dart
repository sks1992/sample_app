import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                  const CircleAvatar(
                    radius: 64,
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8agLYh5KqNIxsU5B0J5d601gO8ubgENaacYEnP6i52Q&s"),
                  ),
                  Positioned(
                    bottom: -10,
                    right: -10,
                    child: IconButton(
                      onPressed: () {},
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
                      Get.toNamed(RouteNames.login);
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
