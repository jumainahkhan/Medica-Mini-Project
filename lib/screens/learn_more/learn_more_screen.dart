import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:medica/screens/learn_more/components/learn_more_screen_body.dart';

class LearnMore extends StatefulWidget {
  const LearnMore({super.key});

  @override
  State<LearnMore> createState() => _LearnMoreState();
}

class _LearnMoreState extends State<LearnMore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#f0f2f0'),
      body: const LearnMoreBody(),
    );
  }
}
