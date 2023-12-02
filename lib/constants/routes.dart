import 'package:flutter/material.dart';
import 'package:medica/nav_bar_activity.dart';
import 'package:medica/screens/home/home_screen.dart';
import 'package:medica/splash_screen.dart';

class Routes {
  static const String home = '/home';
  static const String navBar = '/navBar';
  static const String splash = '/splash';

  static final Map<String, WidgetBuilder> routes = {
    home: (context) => const HomeScreen(),
    navBar: (context) => const NavBarActivity(),
    splash: (context) => const SplashScreen(),
  };
}
