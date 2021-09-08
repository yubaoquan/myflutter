import 'package:flutter/material.dart';

class CurrentIndexProvider with ChangeNotifier {
  int _currentIndex = 1;

  int get currentIndex => _currentIndex;

  changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
