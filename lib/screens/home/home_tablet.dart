import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/app_settings_controller.dart';
import '../../controllers/auth_controller.dart';
import '../../widgets/loading_screen.dart';
import 'widgets/home_widgets.dart';

class HomeTablet extends StatelessWidget {
  const HomeTablet({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthController>();
    final settings = Get.find<AppSettingsController>();

    return Obx(() {
      if (auth.loading.value) {
        return const LoadingScreen();
      }

      return Scaffold(
        appBar: buildHomeAppBar(settings, auth),
        body: Row(
          children: [
            Expanded(flex: 2, child: buildSideMenu()),
            Expanded(flex: 5, child: buildHomeBody(auth)),
          ],
        ),
      );
    });
  }
}