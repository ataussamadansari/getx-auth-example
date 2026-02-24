import 'package:get/get.dart';
import 'package:getx_auth_example/controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController(Get.find()));
  }
}