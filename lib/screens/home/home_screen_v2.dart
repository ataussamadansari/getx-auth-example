import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_auth_example/widgets/loading_screen.dart';

import '../../controllers/app_settings_controller.dart';
import '../../controllers/auth_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    final appSettingController = Get.find<AppSettingsController>();

    return Obx(
      () => authController.loading.value
          ? LoadingScreen()
          : Scaffold(
              appBar: AppBar(
                title: const Text("Home"),
                actions: [
                  DropdownButton<String>(
                    value: appSettingController.language.value,
                    onChanged: (value) {
                      if (value != null) {
                        appSettingController.changeLanguage(value);
                      }
                    },
                    items: const [
                      DropdownMenuItem(value: 'en', child: Text('English')),
                      DropdownMenuItem(value: 'hi', child: Text('Hindi')),
                      DropdownMenuItem(value: 'ur', child: Text('Urdu')),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      appSettingController.toggleTheme();
                    },
                    icon: Icon(
                      appSettingController.isDark.value
                          ? Icons.light_mode
                          : Icons.dark_mode,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      authController.signOut();
                    },
                    icon: const Icon(Icons.logout),
                  ),
                ],
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    authController.authService.currentUser?.email ?? "No User",
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        authController.signOut();
                      },
                      child: Text('logout'.tr),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

