import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/widgets/custom_action_button.dart';
import 'package:graduation_project/core/widgets/custom_text_form_field.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(15),
              Text('Forget Password',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(fontSize: 22)),
              verticalSpace(16.h),
              Text(
                  'At our app, we take the security of your information seriously.',
                  style: Theme.of(context).textTheme.labelSmall),
              verticalSpace(64.h),
              CustomTextFormField(
                validator: (value) {},
                hintText: 'Email',
              ),
              verticalSpace(64.h),
              CustomButton(
                text: 'Reset Password',
                onPressed: () {
                  context.pushNamed(Routes.verification);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
