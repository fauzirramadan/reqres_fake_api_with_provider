import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance();

  static Future saveToken({required String token}) async {
    final prefs = await _prefs;
    prefs.setString("token", token);
  }

  static Future getToken() async {
    final prefs = await _prefs;
    final token = prefs.getString("token");
    return token;
  }

  static Future removeToken() async {
    final prefs = await _prefs;
    prefs.clear();
  }
}
