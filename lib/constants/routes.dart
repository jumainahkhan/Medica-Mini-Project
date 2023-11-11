import 'package:flutter/material.dart';
import 'package:medica/NavBarActivity.dart';
import 'package:medica/Screens/HomeScreen/HomeScreen.dart';

class Routes {
  static const String home = '/home';
  static const String navBar = '/navBar';

  static final Map<String, WidgetBuilder> routes = {
    home: (context) => const HomeScreen(),
    navBar: (context) => const NavBarActivity(),
  };
}
