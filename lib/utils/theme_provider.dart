import "package:flutter/material.dart";
class ThemeProvider with ChangeNotifier{
  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn){
    themeMode = isOn? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}