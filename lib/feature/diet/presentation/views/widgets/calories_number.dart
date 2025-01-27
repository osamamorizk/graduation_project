import 'package:flutter/material.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';

class CaloriesNumber extends StatelessWidget {
  const CaloriesNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsetsDirectional.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(width: .4, color: ColorsManger.darkGrey),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        '200 Cal',
        style: TextStyles.font14BlackRegular,
      ),
    );
  }
}
