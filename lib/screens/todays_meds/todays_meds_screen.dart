import 'package:flutter/material.dart';
import 'package:medica/screens/todays_meds/components/todays_meds_screen_body.dart';

class TodaysMedScreen extends StatefulWidget {
  const TodaysMedScreen({super.key});

  @override
  State<TodaysMedScreen> createState() => _TodaysMedScreenState();
}

class _TodaysMedScreenState extends State<TodaysMedScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: TodaysMedScreenBody(),
    ));
  }
}
