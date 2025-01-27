import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/feature/profile/presentation/views/widgets/profile_option_list.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(16),
            Image.asset(Assets.imagesProfieIcon),
            verticalSpace(16),
            Text(
              'Osama Mohamed',
              style: TextStyles.font16BlackBold,
            ),
            verticalSpace(32),
            const ProfileOptionList(),
          ],
        ),
      ),
    );
  }
}
