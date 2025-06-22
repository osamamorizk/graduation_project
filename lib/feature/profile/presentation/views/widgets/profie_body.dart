import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/helpers/cache_helper.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/feature/profile/presentation/views/widgets/profile_option_list.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(16),
            Image.asset(
              Assets.imagesProfieIcon,
              color: isDark ? ColorsManger.neonPurple : ColorsManger.darkBlue,
            ),
            verticalSpace(16),
            Text(
              CacheHelper.getData(key: 'name') ?? 'user',
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
