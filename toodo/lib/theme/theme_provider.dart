import 'package:flutter/material.dart';
import 'package:toodo/theme/theme.dart';

class ThemeProvider with ChangeNotifier {
  bool isDarkMode = false;

  ThemeData get currentTheme =>  isDarkMode? DarkMode : lightMode ;

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}
