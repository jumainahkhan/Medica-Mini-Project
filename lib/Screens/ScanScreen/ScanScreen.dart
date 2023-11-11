import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:medica/Screens/ScanScreen/components/ScanScreenBody.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#f0f2f0'),
      body: const ScanScreenBody(),
    );
  }
}
