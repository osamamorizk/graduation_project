import 'package:flutter/material.dart';
import 'package:graduation_project/core/themes/text_styles.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By logging, you agree to our ',
            style: TextStyles.font14Regular,
          ),
          TextSpan(
            text: 'Terms & Conditions  ',
            style: TextStyles.font14Regular,
          ),
          TextSpan(
            text: 'and ',
            style: TextStyles.font14Regular,
          ),
          TextSpan(
            text: 'PrivacyPolicy.',
            style: TextStyles.font14Regular,
          ),
        ],
      ),
    );
  }
}
