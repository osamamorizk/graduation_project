import 'package:flutter/material.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';

class DayContainer extends StatelessWidget {
  const DayContainer({
    super.key,
    required this.day,
    required this.isSelected,
  });
  final String day;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: isSelected ? ColorsManger.darkBlue : ColorsManger.grey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          day,
          style: isSelected
              ? TextStyles.font14WhiteBold
              : TextStyles.font14DarkBlueBold,
        ),
      ),
    );
  }
}
