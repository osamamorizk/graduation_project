import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/feature/home/data/models/challenge_model.dart';

class ChallengeDetails extends StatelessWidget {
  const ChallengeDetails({
    super.key,
    required this.challengeModel,
    required this.isDark,
  });

  final ChallengeModel challengeModel;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          height: 75.h,
          fit: BoxFit.fill,
          challengeModel.image,
        ),
        horizontalSpace(16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              challengeModel.title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            verticalSpace(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  height: 24,
                  Assets.svgsCalender,
                  colorFilter: ColorFilter.mode(
                    isDark ? Colors.white : ColorsManger.darkBlue,
                    BlendMode.srcIn,
                  ),
                ),
                Text(
                  '${challengeModel.durationDays} days  |  ',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  challengeModel.level,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
