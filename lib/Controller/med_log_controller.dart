import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MedLogController extends ChangeNotifier {
  int _medCount = 1;
  String? _name;
  bool _morning = false;
  bool _afternoon = false;
  bool _night = false;

  int get medCount => _medCount;
  String? get name => _name;
  bool get morning => _morning;
  bool get afternoon => _afternoon;
  bool get night => _night;

  void setName(String? value) {
    _name = value;
    notifyListeners();
  }

  void setMorning(bool value) {
    _morning = value;
    notifyListeners();
  }

  void setAfternoon(bool value) {
    _afternoon = value;
    notifyListeners();
  }

  void setNight(bool value) {
    _night = value;
    notifyListeners();
  }

  void incrementMedCount() {
    _medCount++;
    notifyListeners();
  }

  void decrementMedCount() {
    _medCount--;
    notifyListeners();
  }
}
