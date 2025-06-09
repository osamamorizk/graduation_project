import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/feature/login/presentation/views/widgets/dont_have_account.dart';
import 'package:graduation_project/feature/login/presentation/views/widgets/login_listener.dart';
import 'package:graduation_project/feature/login/presentation/views/widgets/user_name_and_password.dart';
import 'package:graduation_project/core/widgets/google_button.dart';
import 'package:graduation_project/feature/login/presentation/views/widgets/login_actions.dart';
import 'package:graduation_project/core/widgets/or_widget.dart';
import 'package:graduation_project/feature/login/presentation/views/widgets/welcome_text.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpace(60.h),
              const WelcomeText(),
              verticalSpace(36.h),
              const UserNameAndPassword(),
              verticalSpace(16.h),
              const LoginActions(),
              verticalSpace(32.h),
              const OrWidget(),
              verticalSpace(32.h),
              const GoogleButton(),
              verticalSpace(50.h),
              const DontHaveAccount(),
              const LoginBlocListener()
            ],
          ),
        ),
      ),
    );
  }
}
