import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_auth_example/controllers/app_settings_controller.dart';

import '../../controllers/auth_controller.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final email = TextEditingController();
    final password = TextEditingController();
    final authController = Get.find<AuthController>();
    // final langController = Get.find<LanguageController>();
    final appController = Get.find<AppSettingsController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('signin'.tr),
        actions: [
          DropdownButton<String>(
            value: appController.language.value,
            onChanged: (value) {
              if (value != null) {
                appController.changeLanguage(value);
              }
            },
            items: const [
              DropdownMenuItem(value: 'en', child: Text('English')),
              DropdownMenuItem(value: 'hi', child: Text('Hindi')),
              DropdownMenuItem(value: 'ur', child: Text('Urdu')),
            ],
          )
        ],
      ),
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
                  authController.signIn(
                    email.text.trim(),
                    password.text.trim(),
                  );
                },
                child: authController.loading.value
                    ? CircularProgressIndicator()
                    : Text('signin'.tr),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              Get.toNamed('/signup');
            },
            child: Text('Don\'t have an account? Sign Up'),
          ),
        ],
      ),
    );
  }
}
