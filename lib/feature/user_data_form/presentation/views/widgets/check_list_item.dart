import 'package:flutter/material.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';

class CheckListItem extends StatelessWidget {
  const CheckListItem(
      {super.key,
      required this.isSelected,
      this.onChanged,
      required this.text});
  final bool isSelected;
  final void Function(bool?)? onChanged;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: CheckboxListTile(
        visualDensity: const VisualDensity(horizontal: -4),
        contentPadding: const EdgeInsets.all(0),
        activeColor: ColorsManger.darkBlue,
        value: isSelected,
        onChanged: onChanged,
        title: Text(
          textAlign: TextAlign.start,
          style: isSelected
              ? TextStyles.font14BlackBold.copyWith(fontWeight: FontWeight.w500)
              : TextStyles.font14Regular,
          text,
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  }
}
