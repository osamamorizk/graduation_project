import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/widgets/google_button.dart';
import 'package:graduation_project/core/widgets/or_widget.dart';
import 'package:graduation_project/feature/sign_up/presentation/views/widgets/have_account.dart';
import 'package:graduation_project/feature/sign_up/presentation/views/widgets/sign_up_actions.dart';
import 'package:graduation_project/feature/sign_up/presentation/views/widgets/signup_form.dart';
import 'package:graduation_project/feature/sign_up/presentation/views/widgets/signup_texts.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpace(50.h),
              const SignupTexts(),
              verticalSpace(30.h),
              const SignupForm(),
              verticalSpace(16.h),
              const SignUpActions(),
              verticalSpace(16.h),
              const OrWidget(),
              verticalSpace(16.h),
              const GoogleButton(),
              verticalSpace(16.h),
              const HaveAccount(),
              verticalSpace(16.h),
            ],
          ),
        ),
      ),
    );
  }
}
