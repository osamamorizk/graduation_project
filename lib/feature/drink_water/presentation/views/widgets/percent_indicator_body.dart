import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/text_styles.dart';

class PercentIndicatorBody extends StatelessWidget {
  const PercentIndicatorBody({
    super.key,
    required this.currentIntake,
    required this.dailyTarget,
    this.onTap,
  });

  final int currentIntake;
  final int dailyTarget;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 275,
      width: 275,
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(Assets.imagesWater)),
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          verticalSpace(60),
          Text(
            "${currentIntake.toInt()}/${dailyTarget.toInt()} ml",
            style: TextStyles.font18BlackBold.copyWith(fontSize: 20),
          ),
          Text(
            "Your daily target",
            style: TextStyles.font14BlackRegular,
          ),
          verticalSpace(20),
          GestureDetector(
            onTap: onTap,
            child: Column(
              children: [
                Text(
                  "400 ml",
                  style: TextStyles.font16BlackRegular,
                ),
                verticalSpace(8),
                Image.asset(
                  Assets.imagesWaterBottel,
                ),
                verticalSpace(8),
              ],
            ),
          )
        ],
      ),
    );
  }
}
