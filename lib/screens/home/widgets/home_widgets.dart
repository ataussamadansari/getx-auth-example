import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/app_settings_controller.dart';
import '../../../controllers/auth_controller.dart';

PreferredSizeWidget buildHomeAppBar(
    AppSettingsController settings,
    AuthController authController,
    ) {
  return AppBar(
    title: Text('home'.tr),
    actions: [
      DropdownButton<String>(
        value: settings.language.value,
        underline: const SizedBox(),
        onChanged: (value) {
          if (value != null) {
            settings.changeLanguage(value);
          }
        },
        items: const [
          DropdownMenuItem(value: 'en', child: Text('English')),
          DropdownMenuItem(value: 'hi', child: Text('Hindi')),
          DropdownMenuItem(value: 'ur', child: Text('Urdu')),
        ],
      ),
      Obx(() => IconButton(
        onPressed: settings.toggleTheme,
        icon: Icon(
          settings.isDark.value
              ? Icons.light_mode
              : Icons.dark_mode,
        ),
      )),
      IconButton(
        onPressed: authController.signOut,
        icon: const Icon(Icons.logout),
      ),
    ],
  );
}

Widget buildHomeBody(AuthController authController) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          authController.authService.currentUser?.email ?? "No User",
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: authController.signOut,
          child: Text('logout'.tr),
        ),
      ],
    ),
  );
}

Widget buildSideMenu() {
  return Container(
    color: Colors.grey.withOpacity(0.1),
    child: const Center(
      child: Text("Sidebar"),
    ),
  );
}