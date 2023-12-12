import 'dart:async';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:medica/constants/colors.dart';
import 'package:medica/constants/routes.dart';
import 'package:medica/controller/auth_controller.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late bool isFirstLaunch;
  Timer _timer = Timer(Duration.zero, () {});
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  Future<bool> checkIfFirstLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;
    if (isFirstLaunch) {
      // Do something on first launch
      await prefs.setBool('isFirstLaunch', false);
    }
    debugPrint('isFirstLaunch: $isFirstLaunch');
    return isFirstLaunch;
  }

  Future<String> _getInitialRoute(
      BuildContext context, AuthController authController) async {
    if (authController.isLoggedIn()) {
      debugPrint('User is signed in');
      // if user document does not exist but is logged in, redirect to fill your profile screen
      if (!await authController.doesUserDocumentExist()) {
        debugPrint('User document does not exist');
        return Routes.fillYourProfile;
      }
      return Routes.navBar;
    } else {
      debugPrint('User is not signed in');
      // User is not signed in, redirect to sign in screen
      return Routes.signUp;
    }
  }

  startTimer() async {
    checkIfFirstLaunch().then((isFirstLaunchValue) {
      setState(() {
        isFirstLaunch = isFirstLaunchValue;
      });
      var duration = const Duration(seconds: 2);
      AuthController authController =
          Provider.of<AuthController>(context, listen: false);

      if (isFirstLaunchValue) {
        _timer = Timer(duration, () {
          Navigator.restorablePushNamedAndRemoveUntil(
            context,
            Routes.signUp,
            (route) => false,
          );
        });
      } else {
        _getInitialRoute(context, authController).then((value) async {
          Navigator.restorablePushNamedAndRemoveUntil(
            context,
            value,
            (route) => false,
          );
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    // var w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: h * 0.2,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/graphics/medica_logo.png',
                    height: h * 0.07,
                  ),
                ),
                SizedBox(
                  height: h * 0.2,
                ),
                const SpinKitCircle(
                  //itemBuilder: (context) {},
                  color: MedicaColors.primary,
                )
              ]),
        ),
      ),
    );
  }
}
