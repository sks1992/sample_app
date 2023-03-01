import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
              ReusableTextField(
                labelText: "Password",
                controller: controller.passwordController,
                obscureText: true,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.remove_red_eye),
                ),
                prefixIcon: const Icon(Icons.lock),
              ),
              ReusableTextField(
                labelText: "Confirm Password",
                controller: controller.confirmPasswordController,
                obscureText: true,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.remove_red_eye),
                ),
                prefixIcon: const Icon(Icons.lock),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
