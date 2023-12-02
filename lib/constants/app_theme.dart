import 'package:flutter/material.dart';
import 'package:medica/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // static ThemeData lightTheme = ThemeData(
  //   primaryColor: MedicaColors.primary,
  //   scaffoldBackgroundColor: MedicaColors.scaffoldColor,
  //   colorScheme: const ColorScheme.light(
  //     primary: MedicaColors.primary,
  //   ),
  //   appBarTheme: AppBarTheme(
  //     backgroundColor: MedicaColors.scaffoldColor,
  //     foregroundColor: MedicaColors.black,
  //     elevation: 0,
  //     scrolledUnderElevation: 0,
  //     centerTitle: false,
  //     titleSpacing: 0,
  //     titleTextStyle: textTheme.titleMedium!.copyWith(
  //       color: MedicaColors.black,
  //     ),
  //   ),
  //   radioTheme: RadioThemeData(
  //     fillColor: MaterialStateProperty.all(MedicaColors.primary),
  //   ),
  //   inputDecorationTheme: InputDecorationTheme(
  //       filled: true,
  //       fillColor: MedicaColors.greyLight,
  //       hintStyle: textTheme.labelSmall!.copyWith(
  //         fontWeight: FontWeight.w400,
  //       ),
  //       focusColor: MedicaColors.transparentBlue,
  //       focusedBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(10),
  //         borderSide: const BorderSide(color: MedicaColors.green, width: 2),
  //       ),
  //       enabledBorder: const OutlineInputBorder(
  //         borderRadius: BorderRadius.all(Radius.circular(10)),
  //         borderSide: BorderSide(color: MedicaColors.greyLight),
  //       ),
  //       errorBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(10),
  //         borderSide: const BorderSide(color: MedicaColors.red, width: 2),
  //       ),
  //       focusedErrorBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(10),
  //         borderSide: const BorderSide(color: MedicaColors.red, width: 2),
  //       ),
  //       border: InputBorder.none),
  //   // chipTheme: const ChipThemeData(
  //   //   selectedColor: MedicaColors.primary,

  //   // ),

  //   textTheme: GoogleFonts.urbanistTextTheme(),
  // );

  static TextTheme textTheme = TextTheme(
    // Used fonts (Don't change the following)
    displayLarge: GoogleFonts.urbanist(
        color: Colors.black,
        fontSize: 42,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.4),
    displayMedium: GoogleFonts.urbanist(
        color: Colors.black,
        fontSize: 32,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w900,
        letterSpacing: 0.4),
    titleLarge: GoogleFonts.urbanist(
        color: MedicaColors.black, fontWeight: FontWeight.w600, fontSize: 20),
    titleMedium: GoogleFonts.urbanist(
        color: Colors.black,
        fontStyle: FontStyle.normal,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.4),
    labelMedium: GoogleFonts.urbanist(
        color: MedicaColors.greyDark,
        fontWeight: FontWeight.w400,
        fontSize: 14),
    labelSmall: GoogleFonts.urbanist(
        color: MedicaColors.greyDark,
        fontWeight: FontWeight.w400,
        fontSize: 11),
    titleSmall: GoogleFonts.urbanist(
        color: MedicaColors.black, fontWeight: FontWeight.w600, fontSize: 14),
    bodyLarge: GoogleFonts.urbanist(
        color: MedicaColors.black, fontWeight: FontWeight.w600, fontSize: 24),
    bodyMedium: const TextStyle(
        color: Colors.black,
        fontStyle: FontStyle.normal,
        fontSize: 16,
        letterSpacing: 0.5,
        fontWeight: FontWeight.w400),
    bodySmall: const TextStyle(
        color: Colors.black,
        fontStyle: FontStyle.normal,
        fontSize: 12,
        letterSpacing: 0.5,
        fontWeight: FontWeight.w500),

    //Following fonts are not used in the app
    displaySmall: const TextStyle(
        color: Colors.black,
        fontStyle: FontStyle.normal,
        fontSize: 13,
        letterSpacing: 0.5,
        fontWeight: FontWeight.w600),

    headlineMedium: const TextStyle(
        color: Colors.black,
        fontStyle: FontStyle.normal,
        fontSize: 14,
        letterSpacing: 0.4,
        fontWeight: FontWeight.w500),
  );
}

extension UIThemeExtension on BuildContext {
  TextStyle get heading1 => Theme.of(this).textTheme.displayLarge!;
  TextStyle get heading2 => Theme.of(this).textTheme.displayMedium!;
  TextStyle get heading3 => Theme.of(this).textTheme.displaySmall!;
  TextStyle get heading4 => Theme.of(this).textTheme.headlineMedium!;

  TextStyle get subtitle1 => Theme.of(this).textTheme.titleMedium!;
  TextStyle get subtitle2 => Theme.of(this).textTheme.titleSmall!;

  TextStyle get body1 => Theme.of(this).textTheme.bodyLarge!;
  TextStyle get body2 => Theme.of(this).textTheme.bodyMedium!;
  TextStyle get small1 => Theme.of(this).textTheme.headlineMedium!;
  TextStyle get highlight => Theme.of(this).textTheme.displaySmall!;
  TextStyle get caption => Theme.of(this).textTheme.bodySmall!;
}
