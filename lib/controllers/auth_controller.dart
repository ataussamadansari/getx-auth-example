import 'package:get/get.dart';
import 'package:getx_auth_example/services/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController {
  AuthService authService;
  final loading = false.obs;

  AuthController(this.authService);

  void signIn(String email, String password) async {
    loading.value = true;
    try {
      bool loggedIn = await authService.singIn(email, password);
      if (loggedIn) {
        Get.offAllNamed('/home');
      }
    } on AuthApiException catch (e) {
      Get.snackbar('Auth Error', e.message);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      loading.value = false;
    }
  }

  void signUp(String email, String password) async {
    loading.value = true;
    try {
      bool loggedIn = await authService.signUp(email, password);
      if (loggedIn) {
        Get.offAllNamed('/home');
      }
    } on AuthApiException catch (e) {
      Get.snackbar('Auth Error', e.message);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      loading.value = false;
    }
  }

  void signOut() async {
    loading.value = true;
    await Future.delayed(Duration(seconds: 2));
    try {
      await authService.signOut();
      Get.offAllNamed('/signin');
    } on AuthApiException catch (e) {
      Get.snackbar('Auth Error', e.message);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      loading.value = false;
    }
  }
}
