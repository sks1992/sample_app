import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app/core/controllers/login_controller.dart';
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
      body: Column(
        children: [
          ReusableTextField(
            labelText: "User Name",
            controller: controller.usernameController,
            prefixIcon: const Icon(Icons.person),
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
              child: const Text("Login"),
            ),
          ),
        ],
      ),
    );
  }
}
