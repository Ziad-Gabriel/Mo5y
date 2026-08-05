import 'package:flutter/material.dart';

class MainWidgetsIndexProvider with ChangeNotifier {
  int currentIndex = 0;

  int get getCurrentIndex => currentIndex;

  void setNewIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }
}
