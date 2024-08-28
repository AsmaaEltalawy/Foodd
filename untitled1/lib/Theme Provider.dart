import 'package:flutter/material.dart';
import 'package:untitled1/Theme.dart';

class ThemeProvider with ChangeNotifier{
  var isDark = false;

  ThemeData get currentTheme =>  isDark? dark : Light ;

  void toggleTheme() {
      isDark = !isDark;
      notifyListeners();
  }
}