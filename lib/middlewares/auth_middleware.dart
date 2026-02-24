import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../services/auth_service.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final authService = Get.find<AuthService>();

    if (route == '/home') {
      if (authService.currentUser == null) {
        return RouteSettings(name: '/signin');
      }
    } else if (route == '/signin' || route == '/signup') {
      if (authService.currentUser != null) {
        return RouteSettings(name: '/home');
      }
    }

    return null;
  }
}
