import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final email = TextEditingController();
    final password = TextEditingController();
    final authController = Get.find<AuthController>();

    return Scaffold(
      appBar: AppBar(title: Text("signup".tr)),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          TextFormField(
            controller: email,
            decoration: InputDecoration(
              labelText: "email".tr,
              hintText: "Enter your email",
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: password,
            decoration: InputDecoration(
              labelText: "password".tr,
              hintText: "Enter your password",
            ),
          ),
          const SizedBox(height: 20),
          Obx(
            () => SizedBox(
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  authController.signUp(
                    email.text.trim(),
                    password.text.trim(),
                  );
                },
                child: authController.loading.value
                    ? CircularProgressIndicator()
                    : Text("signup".tr),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('Already have an account? Sign In'),
          ),
        ],
      ),
    );
  }
}
