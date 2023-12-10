import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medica/common/button.dart';
import 'package:medica/common/form_container.dart';
import 'package:medica/constants/app_theme.dart';
import 'package:medica/constants/colors.dart';
import 'package:medica/constants/routes.dart';
import 'package:medica/controller/auth_controller.dart';
import 'package:medica/model/user_model.dart';
import 'package:provider/provider.dart';

class FillYourProfileScreen extends StatefulWidget {
  const FillYourProfileScreen({super.key});

  @override
  State<FillYourProfileScreen> createState() => _FillYourProfileScreenState();
}

class _FillYourProfileScreenState extends State<FillYourProfileScreen> {
  final TextEditingController _fullNameController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  String _dOB = 'Date of Birth';
  String? _gender;
  XFile? _selectedImage;
  final _formKey = GlobalKey<FormState>();

  final int minimumAge = 18;

  bool _isSelectedTC = false;
  List<String> selected = [];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now().subtract(const Duration(days: 365 * 120)),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _dOB = '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
      });
    }
  }

  void _pickImage() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () async {
                  final ImagePicker picker = ImagePicker();
                  final XFile? image =
                      await picker.pickImage(source: ImageSource.camera);
                  setState(() {
                    _selectedImage = image;
                    debugPrint('image: $_selectedImage');
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_album),
                title: const Text('Gallery'),
                onTap: () async {
                  final ImagePicker picker = ImagePicker();
                  final XFile? image =
                      await picker.pickImage(source: ImageSource.gallery);
                  setState(() {
                    _selectedImage = image;
                    debugPrint('image: $_selectedImage');
                  });
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<AuthController>(
          builder: (context, authControllerConsumer, child) {
        return Scaffold(
          appBar: AppBar(
              title: const Text("Fill Your Profile"),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              )),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Stack(
                      children: [
                        Container(
                            width: 150,
                            height: 150,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: _selectedImage == null
                                  ? Image.asset(
                                      'assets/graphics/default_profile_picture.png',
                                      fit: BoxFit.contain,
                                    )
                                  : Image.file(
                                      File(_selectedImage!.path),
                                      fit: BoxFit.contain,
                                    ),
                            )),
                        Positioned(
                          bottom: 5,
                          right: 5,
                          child: Container(
                            width: 35,
                            height: 35,
                            padding: EdgeInsets.zero,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: IconButton(
                                padding: EdgeInsets.zero,
                                color: Colors.white,
                                onPressed: _pickImage,
                                icon: Image.asset(
                                  'assets/graphics/edit_icon.png',
                                  fit: BoxFit.fill,
                                )),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    // text field for the full name
                    TextFormField(
                      controller: _fullNameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Full name cannot be empty';
                        }
                        return null;
                      },
                      style: AppTheme.textTheme.titleSmall,
                      decoration: const InputDecoration(
                        hintText: 'Full Name',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    // date picker for the date of birth
                    FormContainer(
                      initialValue: _dOB,
                      validator: (value) {
                        if (value == 'Date of Birth' || value == null) {
                          return 'Date of birth cannot be empty';
                        }
                        if (selectedDate.isAfter(DateTime.now())) {
                          return 'Date of birth cannot be in the future';
                        }
                        //  calculate age in years
                        var age =
                            DateTime.now().difference(selectedDate).inDays;
                        if (age < 365 * minimumAge) {
                          return 'You must be 18 years or older';
                        }
                        return null;
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _dOB,
                            style: _dOB != 'Date of Birth'
                                ? AppTheme.textTheme.titleSmall!
                                : AppTheme.textTheme.labelMedium,
                          ),
                          IconButton(
                              onPressed: () => _selectDate(context),
                              icon: Icon(
                                Icons.calendar_month_outlined,
                                color: _dOB != 'Date of Birth'
                                    ? MedicaColors.black
                                    : MedicaColors.greyDark,
                                size: 20,
                              )),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    // gender selection
                    FormContainer(
                      initialValue: _gender,
                      validator: (value) {
                        if (value == 'Gender' || value == null) {
                          return 'Gender cannot be empty';
                        }
                        return null;
                      },
                      child: DropdownButton<String>(
                        icon: const Icon(
                          Icons.arrow_drop_down_rounded,
                          color: MedicaColors.greyDark,
                          size: 38,
                        ),
                        padding: const EdgeInsets.only(top: 5),
                        isExpanded: true,
                        underline: const SizedBox(),
                        style: AppTheme.textTheme.titleSmall,
                        hint: Text(
                          'Gender',
                          style: AppTheme.textTheme.labelMedium,
                        ),
                        value: _gender,
                        onChanged: (value) {
                          setState(() {
                            _gender = value;
                          });
                        },
                        items: const [
                          DropdownMenuItem(
                            value: 'male',
                            child: Text('Male'),
                          ),
                          DropdownMenuItem(
                            value: 'female',
                            child: Text('Female'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    const SizedBox(
                      height: 150,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: _isSelectedTC,
                          onChanged: (value) {
                            setState(() {
                              _isSelectedTC = value!;
                            });
                          },
                        ),
                        Text(
                          'I agree to the terms and conditions',
                          style: AppTheme.textTheme.labelMedium,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    // button to submit the form
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Button(
                        shadow: _isSelectedTC,
                        text: 'Submit',
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            // Process data.
                            UserModel userData = UserModel(
                              fullName: _fullNameController.text,
                              gender: _gender,
                              dob: selectedDate,
                              profileImageFile: _selectedImage,
                            );

                            if (await authControllerConsumer
                                .createUserDocument(userData)) {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, Routes.navBar, (route) => false);
                            }
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
