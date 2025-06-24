import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';

class CalorisAndTimeWidget extends StatelessWidget {
  const CalorisAndTimeWidget({
    super.key,
    this.widget,
    this.additional,
    required this.calories,
    required this.duration,
  });
  final Widget? widget;
  final Widget? additional;
  final int calories;
  final int duration;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: 60,
      width: 320,
      decoration: BoxDecoration(
        color: isDarkMode ? ColorsManger.darkBackground : Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 7,
        children: [
          SvgPicture.asset(
            height: 16,
            Assets.svgsCalories,
            colorFilter: ColorFilter.mode(
              isDarkMode ? ColorsManger.neonPurple : ColorsManger.darkBlue,
              BlendMode.srcIn,
            ),
          ),
          Text(
            '$calories cal',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 12,
            child: VerticalDivider(
              thickness: 1.5,
              width: 10,
              color: ColorsManger.grey,
            ),
          ),
          SvgPicture.asset(
            height: 16,
            Assets.svgsClock,
            colorFilter: ColorFilter.mode(
              isDarkMode ? ColorsManger.neonPurple : ColorsManger.darkBlue,
              BlendMode.srcIn,
            ),
          ),
          Text(
            '${duration ~/ 60} min',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          widget ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
