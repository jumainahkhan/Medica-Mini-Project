import 'package:flutter/material.dart';
import 'package:medica/common/button.dart';
import 'package:medica/constants/app_theme.dart';
import 'package:medica/constants/routes.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        )),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Image(
                image: AssetImage('assets/graphics/sign_up_9.png'),
              ),
              Center(
                child: Text(
                  "Let's get you in",
                  style: AppTheme.textTheme.displayLarge,
                ),
              ),
              Button(
                text: 'Sign in with phone',
                onPressed: () {
                  Navigator.pushNamed(context, Routes.createAccount);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
