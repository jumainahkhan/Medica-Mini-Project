import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:medica/controller/user_data_controller.dart';
import 'package:medica/screens/presciptions/components/prescription_screen_body.dart';
import 'package:provider/provider.dart';

class PrescriptionScreen extends StatefulWidget {
  const PrescriptionScreen({super.key});

  @override
  State<PrescriptionScreen> createState() => _PrescriptionScreenState();
}

class _PrescriptionScreenState extends State<PrescriptionScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      UserDataController prescriptionController =
          Provider.of<UserDataController>(context, listen: false);

      prescriptionController.getPrescriptions();
      prescriptionController.listenToPrescriptions();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#f0f2f0'),
      body: const PrescriptionScreenBody(),
    );
  }
}
