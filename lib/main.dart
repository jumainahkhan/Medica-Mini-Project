import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:medica/Controller/nav_bar_controller.dart';
import 'package:medica/constants/routes.dart';
import 'package:provider/provider.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NavBarController>(
          create: (_) => NavBarController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: AppTheme.lightTheme,
        routes: Routes.routes,
        initialRoute: Routes.navBar,
      ),
    );
  }
}
