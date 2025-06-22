import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late final SharedPreferences sharedPref;

  static Future casheIntialization() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  static Future<void> saveInt({required String key, required int value}) async {
    await sharedPref.setInt(key, value);
  }

  static Future<bool> saveData(
      {required String key, required dynamic value}) async {
    if (value is String) {
      return await sharedPref.setString(key, value);
    } else if (value is double) {
      return await sharedPref.setDouble(key, value);
    } else if (value is int) {
      return await sharedPref.setInt(key, value);
    } else {
      return await sharedPref.setBool(key, value);
    }
  }

  static dynamic getData({required String key}) {
    return sharedPref.get(key);
  }

  static int getInt({required String key}) {
    return sharedPref.getInt(key) ?? 2;
  }

  static String getString({required String key}) {
    return sharedPref.getString(key) ?? 'user';
  }

  static bool getBool({required String key}) {
    return sharedPref.getBool(key) ?? false;
  }

  static Future<void> saveSecuredData(
      {required String key, required dynamic value}) async {
    const flutterSecureStorage = FlutterSecureStorage();
    return await flutterSecureStorage.write(key: key, value: value);
  }

  static dynamic getSecuredData({required String key}) async {
    const flutterSecureStorage = FlutterSecureStorage();
    return await flutterSecureStorage.read(key: key);
  }
}
