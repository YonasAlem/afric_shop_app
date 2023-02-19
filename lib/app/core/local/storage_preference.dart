import 'package:shared_preferences/shared_preferences.dart';

class StoragePreference {
  const StoragePreference();

  static late SharedPreferences prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static void setBoolValue(String key, bool value) {
    prefs.setBool(key, value);
  }

  static void setStringValue(String key, String value) {
    prefs.setString(key, value);
  }
}
