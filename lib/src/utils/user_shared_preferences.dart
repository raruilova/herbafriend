import 'package:shared_preferences/shared_preferences.dart';

Future<bool> getDarkMode() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool darkMode = prefs.getBool('darkMode') ?? false;
  return darkMode;
}

void setDarkMode(bool value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('darkMode', value);
}
