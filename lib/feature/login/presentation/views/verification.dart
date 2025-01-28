import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/core/widgets/custom_action_button.dart';
import 'package:graduation_project/feature/login/presentation/views/widgets/custom_pin_put.dart';

class Verification extends StatelessWidget {
  const Verification({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
          iconTheme: IconThemeData(color: ColorsManger.darkBlue),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              verticalSpace(15),
              Text(
                'Verification',
                style: TextStyles.font28DarkBlueBold,
              ),
              verticalSpace(16.h),
              Text(
                'Add a PIN number to make your account more secure and easy to sign in.',
                style: TextStyles.font14greyNormal,
              ),
              verticalSpace(64.h),
              const Center(child: OtpTextField()),
              verticalSpace(64.h),
              CustomButton(
                text: 'Submit',
                onPressed: () {
                  context.pushNamedAndRemoveUntil(
                    Routes.login,
                    predicate: (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
