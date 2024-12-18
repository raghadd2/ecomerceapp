import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool?> setData(
      {required String key, required dynamic value}) async {
    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is bool) return await sharedPreferences.setBool(key, value);
    return null;
  }

  static dynamic getData(String key) {
    return sharedPreferences.get(key);
  }

  static Future<bool?> removeData(String key) async {
    return await sharedPreferences.remove(key);
  }

  static void clearData() {
    sharedPreferences.clear();
  }
}
