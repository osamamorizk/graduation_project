import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/helpers/spacing.dart';

class SignupTexts extends StatelessWidget {
  const SignupTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Create Account',
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(fontSize: 24.sp)),
        verticalSpace(10.h),
        Text(
            'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
            style: Theme.of(context).textTheme.labelSmall),
      ],
    );
  }
}
