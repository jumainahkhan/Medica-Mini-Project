import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CameraControllerX extends ChangeNotifier {
  bool flashOn = false;

  void changeFlash(bool value) {
    flashOn = value;
    notifyListeners();
  }
}
