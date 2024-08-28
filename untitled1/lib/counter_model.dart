import 'package:flutter/material.dart';
class CounterModel with ChangeNotifier{
  var _current_number = 0;

  void increment() {

    _current_number++;
    notifyListeners();

  }

  get current_number => _current_number;
}