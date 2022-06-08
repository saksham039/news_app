import 'package:shared_preferences/shared_preferences.dart';

class localStorage{
  static Future<bool> saveTheme(String type) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    bool result = await shared.setString('theme', type);
    return result;
  }

  static Future<String?> getTheme() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    String? result = await shared.getString('theme') ?? 'light';
    return result;
  }
}