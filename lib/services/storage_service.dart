import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  static StorageService get to => Get.find();

  final GetStorage _box = GetStorage();

  /// 🔐 Keys
  final String _emailKey = "email";
  final String _tokenKey = "token";
  final String _userIdKey = "user_id";

  // ==============================
  // GENERIC SAVE
  // ==============================

  Future<void> saveData<T>(String key, T value) async {
    await _box.write(key, value);
  }

  // ==============================
  // SAVE DATA
  // ==============================

  Future<void> saveEmail(String email) async {
    await _box.write(_emailKey, email);
  }

  Future<void> saveToken(String token) async {
    await _box.write(_tokenKey, token);
  }

  Future<void> saveUserId(String userId) async {
    await _box.write(_userIdKey, userId);
  }

  // ==============================
  // GENERIC GET (Type Safe)
  // ==============================

  T? getData<T>(String key) {
    return _box.read<T>(key);
  }

  // ==============================
  // GET DATA
  // ==============================

  String? get email => _box.read(_emailKey);

  String? get token => _box.read(_tokenKey);

  String? get userId => _box.read(_userIdKey);

  // ==============================
  // REMOVE SINGLE DATA
  // ==============================

  Future<void> removeData<T>(String key) async {
    await _box.remove(key);
  }

  Future<void> removeEmail() async {
    await _box.remove(_emailKey);
  }

  Future<void> removeToken() async {
    await _box.remove(_tokenKey);
  }

  // ==============================
  // CLEAR ALL DATA (Logout)
  // ==============================

  Future<void> clearAll() async {
    await _box.erase();
  }
}