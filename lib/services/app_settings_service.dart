import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppSettingsService extends GetxService {
  static AppSettingsService get to => Get.find();

  final GetStorage _box = GetStorage();
  final _langKey = "app_language";
  final _themeKey = "is_dark_mode";

  // ---------------- LANGUAGE ----------------

  String get language =>
      _box.read(_langKey) ?? 'en';

  Future<void> saveLanguage(String code) async {
    await _box.write(_langKey, code);
  }

  // ---------------- THEME ----------------

  bool get isDarkMode =>
      _box.read(_themeKey) ?? false;

  Future<void> saveTheme(bool isDark) async {
    await _box.write(_themeKey, isDark);
  }

  ThemeMode get themeMode =>
      isDarkMode ? ThemeMode.dark : ThemeMode.light;
}