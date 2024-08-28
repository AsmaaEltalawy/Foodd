import 'package:flutter/material.dart';

  ThemeData Light = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: Colors.cyan.withOpacity(.1),
      secondary: Colors.cyanAccent.shade700,
        surface: Colors.blueGrey.shade100,
    )
  );

ThemeData dark = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: Colors.grey.shade700,
    surface: Colors.black,
  ),
);