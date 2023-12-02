import 'package:flutter/material.dart';
import 'package:medica/constants/app_theme.dart';
import 'package:medica/constants/colors.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool shadow;
  final TextStyle? textStyle;

  const Button({
    super.key,
    this.text = 'Text here',
    this.shadow = false,
    this.onPressed,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      width: double.infinity,
      decoration: shadow
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              boxShadow: const [
                BoxShadow(
                  color: MedicaColors.lightPurple,
                  blurRadius: 15,
                  offset: Offset(0, 10),
                ),
              ],
            )
          : null,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: MedicaColors.primary,
            foregroundColor: MedicaColors.white,
            textStyle: AppTheme.textTheme.titleMedium,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            elevation: 0),
        onPressed: onPressed,
        child: Text(text, style: textStyle),
      ),
    );
  }
}

class CancelButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool shadow;

  const CancelButton({
    super.key,
    this.text = 'Text here',
    this.shadow = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      width: double.infinity,
      decoration: shadow
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              boxShadow: const [
                BoxShadow(
                  color: MedicaColors.lightPurple,
                  blurRadius: 15,
                  offset: Offset(0, 10),
                ),
              ],
            )
          : null,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: MedicaColors.white,
            foregroundColor: MedicaColors.primary,
            textStyle: AppTheme.textTheme.titleMedium,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            elevation: 0),
        onPressed: onPressed,
        child: Text(
          text,
        ),
      ),
    );
  }
}

class BorderedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool shadow;
  final TextStyle? textStyle;

  const BorderedButton({
    super.key,
    this.text = 'Text here',
    this.shadow = false,
    this.onPressed,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      width: double.infinity,
      decoration: shadow
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              boxShadow: const [
                BoxShadow(
                  color: MedicaColors.lightPurple,
                  blurRadius: 15,
                  offset: Offset(0, 10),
                ),
              ],
            )
          : null,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: MedicaColors.white,
            foregroundColor: MedicaColors.white,
            textStyle: AppTheme.textTheme.titleMedium,
            shape: RoundedRectangleBorder(
                side: const BorderSide(color: MedicaColors.primary, width: 2),
                borderRadius: BorderRadius.circular(100)),
            elevation: 0),
        onPressed: onPressed,
        child: Text(text, style: textStyle),
      ),
    );
  }
}
