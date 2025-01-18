import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/text_styles.dart';

class DietGeneralPlans extends StatelessWidget {
  const DietGeneralPlans({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.imagesDepressedMan),
            verticalSpace(20),
            Text(
              'Still working on it',
              style: TextStyles.font16BlackBold,
            )
          ],
        ),
      ),
    );
  }
}
