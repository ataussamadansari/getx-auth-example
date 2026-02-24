import 'package:get/get.dart';
import 'package:getx_auth_example/controllers/app_settings_controller.dart';
import 'package:getx_auth_example/controllers/auth_controller.dart';
import 'package:getx_auth_example/services/auth_service.dart';
import 'package:getx_auth_example/services/storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class InitialBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(StorageService(), permanent: true);
    Get.put(AppSettingsController());
    Get.put(Supabase.instance.client);
    Get.put(AuthService(Get.find()));
    Get.put(AuthController(Get.find()));
  }
}