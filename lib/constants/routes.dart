import 'package:flutter/material.dart';
import 'package:medica/nav_bar_activity.dart';
import 'package:medica/screens/add_manually/add_manually_screen.dart';
import 'package:medica/screens/home/home_screen.dart';
import 'package:medica/screens/presciptions/components/display_prescription_screen.dart';
import 'package:medica/screens/presciptions/components/presciption_detail.dart';
import 'package:medica/screens/presciptions/prescription_screen.dart';
import 'package:medica/screens/sign_up/create_account_screen.dart';
import 'package:medica/screens/sign_up/fill_your_profile.dart';
import 'package:medica/screens/sign_up/otp_screen.dart';
import 'package:medica/screens/sign_up/sign_up.dart';
import 'package:medica/splash_screen.dart';

class Routes {
  static const String home = '/home';
  static const String navBar = '/navBar';
  static const String splash = '/splash';
  static const String createAccount = '/createAccount';
  static const String otp = '/otp';
  static const String fillYourProfile = '/fillYourProfile';
  static const String signUp = '/signUp';
  static const String addManually = '/addManually';
  static const String prescriptionScreen = '/prescriptionScreen';
  static const String prescriptionDetail = '/prescriptionDetail';
  static const String displayPrescription = 'displayPrescription';

  static final Map<String, WidgetBuilder> routes = {
    home: (context) => const HomeScreen(),
    navBar: (context) => const NavBarActivity(),
    splash: (context) => const SplashScreen(),
    createAccount: (context) => const CreateAccountScreen(),
    otp: (context) => OtpScreen(
          argument: ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>,
        ),
    fillYourProfile: (context) => const FillYourProfileScreen(),
    signUp: (context) => const SignUpScreen(),
    addManually: (context) => const AddManuallyScreen(),
    prescriptionScreen: (context) => const PrescriptionScreen(),
    prescriptionDetail: (context) => const PrescriptionDetails(),
  };
}
