import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:medica/screens/presciptions/components/prescription_screen_body.dart';

class PrescriptionScreen extends StatefulWidget {
  const PrescriptionScreen({super.key});

  @override
  State<PrescriptionScreen> createState() => _PrescriptionScreenState();
}

class _PrescriptionScreenState extends State<PrescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#f0f2f0'),
      body: const PrescriptionScreenBody(),
    );
  }
}
