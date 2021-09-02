import 'dart:convert';

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

void storeUserData(resp) async {
  final prefs = await SharedPreferences.getInstance();
  Map<String, dynamic> user = resp['user'];
  user.putIfAbsent('jwt', () => resp['jwt']);
  prefs.setString('user', json.encode(user));
}
