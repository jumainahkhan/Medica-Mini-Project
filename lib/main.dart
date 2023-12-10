import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:medica/controller/auth_controller.dart';
import 'package:medica/controller/camera_controller.dart';
import 'package:medica/controller/med_log_controller.dart';
import 'package:medica/controller/nav_bar_controller.dart';
import 'package:medica/controller/user_data_controller.dart';
import 'package:medica/constants/routes.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthController>(
          create: (_) => AuthController(),
        ),
        ChangeNotifierProvider<NavBarController>(
          create: (_) => NavBarController(),
        ),
        ChangeNotifierProvider<UserDataController>(
          create: (_) => UserDataController(),
        ),
        ChangeNotifierProvider<MedLogController>(
          create: (_) => MedLogController(),
        ),
        ChangeNotifierProvider<CameraControllerX>(
            create: (_) => CameraControllerX()),
      ],
      child:
          Consumer<AuthController>(builder: (context, authController, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: Routes.routes,
            initialRoute: Routes.splash);
      }),
    );
  }
}
