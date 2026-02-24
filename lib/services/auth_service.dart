import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'storage_service.dart';

class AuthService extends GetxService {
  SupabaseClient supabase;
  User? currentUser;
  final storage = StorageService.to;

  @override
  void onInit() {
    currentUser = supabase.auth.currentUser;
    supabase.auth.onAuthStateChange.listen((event) async {
      currentUser = event.session?.user;
      if (currentUser != null) {
        await storage.saveEmail(currentUser!.email!);
        await storage.saveToken(supabase.auth.currentSession!.accessToken);
        await storage.saveUserId(currentUser!.id);
      }
    });

    super.onInit();
  }

  AuthService(this.supabase);

  Future<bool> singIn(String email, String password) async {
    try {
      await supabase.auth.signInWithPassword(email: email, password: password);
      await Future.delayed(Duration(microseconds: 200));
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> signUp(String email, String password) async {
    try {
      await supabase.auth.signUp(email: email, password: password);
      await Future.delayed(Duration(microseconds: 200));
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> signOut() async {
    try {
      await supabase.auth.signOut();
      await storage.clearAll();
      await Future.delayed(Duration(microseconds: 200));
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
