import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medica/common/button.dart';
import 'package:medica/common/loading_overlay.dart';
import 'package:medica/constants/app_theme.dart';
import 'package:medica/constants/routes.dart';
import 'package:medica/controller/auth_controller.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  final Map<String, dynamic> argument;

  const OtpScreen({super.key, required this.argument});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late AuthController _authController;
  late List<TextEditingController> _otpController;
  late List<FocusNode> _focusNodes;
  late Timer timer;
  int _currentIndex = 0;
  late String _phoneNumber;
  int _resendTimer = 59;

  @override
  void initState() {
    _authController = Provider.of<AuthController>(context, listen: false);
    _otpController =
        List.generate(6, (index) => TextEditingController(text: ''));
    _focusNodes = List.generate(6, (index) => FocusNode());
    _phoneNumber = widget.argument['phoneNumber'];

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _authController.signUp(_phoneNumber);
      _startResendTimer();
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    for (var controller in _otpController) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    timer.cancel();
    super.dispose();
  }

  void _onOtpChanged(String value) {
    if (value.length == 1 && _currentIndex != 5) {
      _focusNodes[_currentIndex].unfocus();
      _currentIndex++;
      _focusNodes[_currentIndex].requestFocus();
    } else if (value.isEmpty && _currentIndex != 0) {
      _focusNodes[_currentIndex].unfocus();
      _currentIndex--;
      _focusNodes[_currentIndex].requestFocus();
    }
  }

  void _startResendTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_resendTimer > 0) {
          _resendTimer--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  void _resendOtp() {
    _authController.signUp(_phoneNumber);
    _startResendTimer();
    setState(() {
      _resendTimer = 60;
    });
  }

  void onPressed() async {
    final otp = _otpController.map((controller) => controller.text).join();
    if (await _authController.verifyOtp(otp)) {
      if (await _authController.doesUserDocumentExist()) {
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.navBar, (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
          context,
          arguments: {
            'phoneNumber': _phoneNumber,
          },
          Routes.fillYourProfile,
          (route) => false,
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid OTP'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<AuthController>(
          builder: (context, authControllerConsumer, child) {
        return LoadingOverlay(
          isLoading: authControllerConsumer.isLoading,
          child: Scaffold(
            appBar: AppBar(
              title: Text('OTP Code Verification',
                  style: AppTheme.textTheme.titleMedium),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 25, 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  Column(
                    children: [
                      Center(
                        child: Text(
                          "Code has been sent to $_phoneNumber",
                          style: AppTheme.textTheme.bodyMedium,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 60, 0, 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(
                            6,
                            (index) => SizedBox(
                              width: 40,
                              child: TextField(
                                maxLines: 1,
                                maxLength: 1,
                                autofocus: index == 0,
                                controller: _otpController[index],
                                focusNode: _focusNodes[index],
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 24),
                                decoration: const InputDecoration(
                                  counterText: '',
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 8),
                                ),
                                onChanged: _onOtpChanged,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: _resendTimer > 0 ? null : _resendOtp,
                        child: Text(
                          _resendTimer > 0
                              ? 'Resend code in $_resendTimer seconds'
                              : 'Resend code',
                          style: TextStyle(
                            color: _resendTimer > 0
                                ? Colors.grey
                                : Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Button(
                    text: 'Verify',
                    onPressed: onPressed,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
