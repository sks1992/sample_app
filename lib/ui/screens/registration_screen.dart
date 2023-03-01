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
              InkWell(
                onTap: () {},
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
                  child: const Text("Register"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
