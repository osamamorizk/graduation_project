import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';

class CustomSingleSelectedItem extends StatelessWidget {
  const CustomSingleSelectedItem({
    super.key,
    required this.title,
    this.image,
    this.subtitle,
    required this.isSelected,
    this.titleAlignment,
    this.textAlign,
  });
  final String title;
  final Image? image;
  final Text? subtitle;
  final bool isSelected;
  final ListTileTitleAlignment? titleAlignment;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.bounceInOut,
      height: 57.h,
      decoration: BoxDecoration(
          color: !isSelected ? Colors.white : ColorsManger.lighterBlue,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              width: .5,
              color:
                  !isSelected ? Colors.grey.shade300 : ColorsManger.darkBlue)),
      duration: const Duration(
        milliseconds: 350,
      ),
      child: ListTile(
        titleAlignment: titleAlignment,
        minTileHeight: 57.h,
        leading: image,
        title: Text(
          textAlign: textAlign,
          title,
          style: TextStyles.font14BlackBold,
        ),
        subtitle: subtitle,
      ),
    );
  }
}
