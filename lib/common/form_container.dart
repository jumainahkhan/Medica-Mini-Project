import 'package:flutter/material.dart';
import 'package:medica/constants/app_theme.dart';
import 'package:medica/constants/colors.dart';

class FormContainer extends StatelessWidget {
  final Widget child;
  // validator
  final String? Function(String?)? validator;
  final String? initialValue;
  const FormContainer(
      {super.key, required this.child, this.validator, this.initialValue});

  @override
  Widget build(BuildContext context) {
    return FormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: initialValue != null ? Key(initialValue!) : null,
        validator: validator,
        initialValue: initialValue,
        builder: (field) {
          return Column(
            children: [
              Container(
                height: 58,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: MedicaColors.greyLight,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: field.hasError
                          ? MedicaColors.red
                          : MedicaColors.greyLight,
                      width: 2),
                ),
                child: child,
              ),
              if (field.hasError)
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        child: Text(
                          field.errorText ?? '',
                          style: AppTheme.textTheme.labelSmall!.copyWith(
                            color: MedicaColors.errorRed,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          );
        });
  }
}
