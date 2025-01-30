import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/widgets/custom_action_button.dart';

class SignUpActions extends StatelessWidget {
  const SignUpActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          onPressed: () {
            context.pushNamed(Routes.dataForm, arguments: '');
          },
          text: 'Create Account',
        ),
      ],
    );
  }
}
