import 'package:flutter/material.dart';
import 'package:medica/common/button.dart';
import 'package:medica/constants/app_theme.dart';
import 'package:medica/constants/colors.dart';
import 'package:medica/constants/routes.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController _phoneController = TextEditingController();
  late FocusNode _phoneFocusNode;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _phoneFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _phoneFocusNode.dispose();
    super.dispose();
  }

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
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Image(
                image: AssetImage('assets/graphics/heed_logo.png'),
              ),
              Center(
                child: Text(
                  "Create a new account",
                  style: AppTheme.textTheme.displayMedium,
                ),
              ),
              Form(
                key: _formKey,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Phone number cannot be empty';
                    } else if (value.length != 10) {
                      return 'Phone number must be 10 digits long';
                    }
                    return null;
                  },
                  focusNode: _phoneFocusNode,
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  style: AppTheme.textTheme.bodyMedium,
                  maxLength: 10,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.phone,
                        size: 18,
                        color: MedicaColors.greyDark,
                      ),
                      counterText: '',
                      border: InputBorder.none,
                      hintText: 'Phone',
                      hintStyle: AppTheme.textTheme.labelMedium),
                ),
              ),
              Button(
                  text: 'Sign Up',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _phoneFocusNode.unfocus();
                      _phoneFocusNode.canRequestFocus = false;
                      Navigator.pushNamed(context, Routes.otp, arguments: {
                        'phoneNumber': '+91${_phoneController.text}',
                      });
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
