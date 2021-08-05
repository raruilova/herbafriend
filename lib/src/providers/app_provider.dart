import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  bool _darkMode = false;

  bool get darkMode {
    return this._darkMode;
  }

  set darkMode(bool value) {
    this._darkMode = value;
    notifyListeners();
  }
}
