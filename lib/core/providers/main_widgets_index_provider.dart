import 'package:flutter/material.dart';

class MainWidgetsIndexProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get getCurrentIndex => _currentIndex;

  void setNewIndex(int newIndex) {
    _currentIndex = newIndex;
    notifyListeners();
  }
}
