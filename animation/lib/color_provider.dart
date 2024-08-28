import 'package:flutter/material.dart';

class ColorProvider with ChangeNotifier {
  double width = 200;

  double high = 200;

  Color color = Colors.green;

  double opacity = 1;

  double top = 150;

  void ChangeSize() {
    width = width == 200 ? 10 : 200;
    high = high == 200 ? 10 : 200;
    color = color == Colors.green ? Colors.lightBlueAccent : Colors.green;
    opacity = opacity == 1 ? 0 : 1;
    top = top == 150 ? 300 : 150;
    notifyListeners();
  }
}
