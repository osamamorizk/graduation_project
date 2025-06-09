import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/routes/routes.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: 'Don\'t have an account?  ',
            style: Theme.of(context).textTheme.bodyLarge),
        TextSpan(
          text: 'Sign Up',
          style: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(fontWeight: FontWeight.bold, fontSize: 16.sp),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              context.pushReplacementNamed(Routes.signUp);
            },
        ),
      ]),
    );
  }
}
