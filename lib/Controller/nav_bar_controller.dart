import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NavBarController extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void changeIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
