import 'package:get/get.dart';
import 'package:getx_auth_example/services/auth_service.dart';

class SplashController extends GetxController {
  AuthService authService;

  SplashController(this.authService);

  @override
  void onInit() {
    checkAuth();
    super.onInit();
  }

  void checkAuth() async {
    await Future.delayed(Duration(seconds: 3));

    if(authService.currentUser == null) {
      Get.offAllNamed('/signin');
    } else {
      Get.offAllNamed('/home');
    }
  }
}