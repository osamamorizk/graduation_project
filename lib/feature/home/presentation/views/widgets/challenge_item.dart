import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/feature/home/data/models/challenge_model.dart';

class ChallengeItem extends StatelessWidget {
  const ChallengeItem({super.key, required this.challengeModel});
  final ChallengeModel challengeModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 94.h,
      decoration: const BoxDecoration(
          border: BorderDirectional(
              bottom: BorderSide(width: .3, color: Colors.grey))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            challengeModel.image,
            width: 80.w,
          ),
          horizontalSpace(16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                challengeModel.title,
                style: TextStyles.font14BlackBold,
              ),
              verticalSpace(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    height: 24,
                    Assets.svgsCalender,
                  ),
                  Text(
                    '${challengeModel.durationDays} days  |  ',
                    style: TextStyles.font14greyNormal
                        .copyWith(color: ColorsManger.blueGrey),
                  ),
                  Text(
                    challengeModel.level,
                    style: TextStyles.font14greyNormal
                        .copyWith(color: ColorsManger.blueGrey),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
