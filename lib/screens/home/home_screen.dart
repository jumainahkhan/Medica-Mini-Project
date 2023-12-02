import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:medica/screens/home/components/home_screen_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#f0f2f0'),
      body: const HomeScreenBody(),
    );
  }
}
