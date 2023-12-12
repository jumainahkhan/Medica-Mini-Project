// A widget that displays the picture taken by the user.
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medica/constants/colors.dart';

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const Icon(
            Icons.arrow_back_ios,
            color: MedicaColors.primary,
          ),
          title: Text(
            'Display the Picture',
            style: GoogleFonts.poppins(
              color: MedicaColors.primary,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          )),

      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
    );
  }
}
