import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/feature/drink_water/presentation/views/widgets/percent_indicator_body.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PercentIndicatorWidget extends StatelessWidget {
  const PercentIndicatorWidget({
    super.key,
    required this.percent,
    required this.currentIntake,
    required this.dailyTarget,
    this.onTap,
  });

  final double percent;
  final double currentIntake;
  final double dailyTarget;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: CircularPercentIndicator(
            arcType: ArcType.HALF,
            radius: 150,
            lineWidth: 7,
            animation: true,
            arcBackgroundColor: ColorsManger.grey,
            percent: percent > 1 ? 1 : percent,
            progressColor: ColorsManger.darkBlue,
            center: PercentIndicatorBody(
              onTap: onTap,
              currentIntake: currentIntake,
              dailyTarget: dailyTarget,
            ),
            backgroundColor: Colors.black,
            circularStrokeCap: CircularStrokeCap.round,
          ),
        ),
        Positioned(
          left: 10,
          bottom: 119,
          child: Image.asset(Assets.imagesLessWater),
        ),
        Positioned(
          right: 10,
          bottom: 122,
          child: Image.asset(Assets.imagesMoreWater),
        ),
      ],
    );
  }
}
