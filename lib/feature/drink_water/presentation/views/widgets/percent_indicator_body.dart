import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';

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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: 275,
      width: 275,
      decoration: BoxDecoration(
        image: const DecorationImage(image: AssetImage(Assets.imagesWater)),
        color: isDark ? ColorsManger.darkBackground : Colors.white,
        shape: BoxShape.circle,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          verticalSpace(60),
          Text(
            "${currentIntake.toInt()} /${dailyTarget.toInt()} ml",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: ColorsManger.darkBlue,
                ),
          ),
          Text(
            "Your daily target",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.black,
                ),
          ),
          verticalSpace(15),
          GestureDetector(
            onTap: onTap,
            child: Column(
              children: [
                Text(
                  "400 ml",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.black,
                      ),
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
