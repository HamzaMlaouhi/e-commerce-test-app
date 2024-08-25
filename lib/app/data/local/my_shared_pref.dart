import 'package:shared_preferences/shared_preferences.dart';

class MySharedPref {
  MySharedPref._();

  static late SharedPreferences _sharedPreferences;

  static const String _fcmTokenKey = 'fcm_token';
  static const String _lightThemeKey = 'is_theme_light';

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static setStorage(SharedPreferences sharedPreferences) {
    _sharedPreferences = sharedPreferences;
  }

  static Future<void> setThemeIsLight(bool lightTheme) =>
      _sharedPreferences.setBool(_lightThemeKey, lightTheme);

  static bool getThemeIsLight() =>
      _sharedPreferences.getBool(_lightThemeKey) ?? true; 

  static Future<void> setFcmToken(String token) =>
      _sharedPreferences.setString(_fcmTokenKey, token);

  static String? getFcmToken() =>
      _sharedPreferences.getString(_fcmTokenKey);

  static Future<void> clear() async => await _sharedPreferences.clear();

}