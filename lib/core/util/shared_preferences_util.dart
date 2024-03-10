import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  static Future<SharedPreferences> _getInstance() async {
    return await SharedPreferences.getInstance();
  }

  static Future<void> setData(String key, dynamic value) async {
    final prefs = await _getInstance();
    switch (value.runtimeType) {
      case const (String):
        await prefs.setString(key, value);
        break;
      case const (int):
        await prefs.setInt(key, value);
        break;
      case const (bool):
        await prefs.setBool(key, value);
        break;
      case const (double):
        await prefs.setDouble(key, value);
        break;
      case const (List<String>):
        await prefs.setStringList(key, value);
        break;
      default:
        throw Exception("Unsupported data type for SharedPreferences");
    }
  }

  static Future<dynamic> getData(String key) async {
    final prefs = await _getInstance();
    final value = prefs.get(key);
    return value;
  }
}
