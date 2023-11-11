import 'package:flutter/material.dart';
import 'package:medica/Screens/AddManuallyScreen.dart/components/AddManuallyScreenBody.dart';

class AddManuallyScreen extends StatefulWidget {
  const AddManuallyScreen({super.key});

  @override
  State<AddManuallyScreen> createState() => _AddManuallyScreenState();
}

class _AddManuallyScreenState extends State<AddManuallyScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(body: AddManuallyScreenBody()));
  }
}
