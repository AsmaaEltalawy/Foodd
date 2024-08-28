import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade200,
    primary: Colors.pink.shade400,
  ),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.grey.shade200,
    foregroundColor: Colors.grey.shade700,
  ),

);

ThemeData DarkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme:  ColorScheme.dark(
    surface: Colors.black,
   primary: Colors.pinkAccent.shade100,
  ),
  appBarTheme: const AppBarTheme(
    foregroundColor: Colors.white,
    centerTitle: true,
  ),
  dialogBackgroundColor: Colors.grey.shade900
 );
