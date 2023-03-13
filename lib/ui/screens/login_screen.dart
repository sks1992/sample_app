import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app/app_route.dart';
import 'package:sample_app/core/controllers/login_controller.dart';
import 'package:sample_app/core/util/helpers.dart';
import 'package:sample_app/ui/widgets/reusable_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ReusableTextField(
                labelText: "User Name",
                controller: controller.usernameController,
                prefixIcon: const Icon(Icons.person),
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
              InkWell(
                onTap: () async {
                  hideKeyboard();
                  await controller.loginUser();
                },
                child: Container(
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
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
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
                        const Text("Don't Have An Registered Account.Go To "),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.offNamed(RouteNames.registration);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text(
                        "Register",
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
