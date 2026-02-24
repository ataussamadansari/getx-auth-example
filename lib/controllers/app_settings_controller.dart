import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/app_settings_service.dart';

class AppSettingsController extends GetxController {
  final _service = AppSettingsService.to;

  final language = ''.obs;
  final isDark = false.obs;

  @override
  void onInit() {
    language.value = _service.language;
    isDark.value = _service.isDarkMode;
    super.onInit();
  }

  // ---------------- LANGUAGE ----------------

  void changeLanguage(String code) {
    language.value = code;
    Get.updateLocale(Locale(code));
    _service.saveLanguage(code);
  }

  // ---------------- THEME ----------------

  ThemeMode get themeMode =>
      isDark.value ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    isDark.value = !isDark.value;
    Get.changeThemeMode(themeMode);
    _service.saveTheme(isDark.value);
  }
}