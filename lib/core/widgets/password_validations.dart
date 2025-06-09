import 'package:flutter/material.dart';
import 'package:graduation_project/core/themes/text_styles.dart';

class PasswordValidations extends StatelessWidget {
  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasNaumber,
    required this.hasSpecialCharcter,
    required this.hasMinLength,
  });
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasNaumber;
  final bool hasSpecialCharcter;
  final bool hasMinLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationItem('At least 1 lowercase letter', hasLowerCase),
        buildValidationItem('At least 1 Upercase letter', hasUpperCase),
        buildValidationItem(
            'At least 1 special character ', hasSpecialCharcter),
        buildValidationItem('At least 1 number letter', hasNaumber),
        buildValidationItem('At least 8 characters long', hasMinLength),
      ],
    );
  }

  ListTile buildValidationItem(String text, bool isValidate) {
    return ListTile(
      minTileHeight: 0,
      minVerticalPadding: 0,
      minLeadingWidth: 0,
      horizontalTitleGap: 10,
      leading: const CircleAvatar(
        radius: 2.4,
        backgroundColor: Colors.grey,
      ),
      title: Text(
        text,
        style: TextStyles.font14Regular.copyWith(
          decoration: isValidate ? TextDecoration.lineThrough : null,
          decorationColor: Colors.green,
          decorationThickness: 2,
          color: isValidate ? Colors.grey : Colors.black,
        ),
      ),
    );
  }
}
