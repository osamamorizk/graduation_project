import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';

class GpDietInfo extends StatelessWidget {
  const GpDietInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 320,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 7,
        children: [
          SvgPicture.asset(
            height: 16,
            Assets.svgsCalories,
            colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
          ),
          Text(
            '135 kcal',
            style: TextStyles.font14BlackBold.copyWith(fontSize: 12),
          ),
          SizedBox(
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
            colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
          ),
          Text(
            '10 min',
            style: TextStyles.font14BlackBold.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
