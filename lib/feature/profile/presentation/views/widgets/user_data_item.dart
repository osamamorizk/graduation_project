import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';

Widget userDataItem(String label, String value,
    {IconData? trailingIcon, String? trailingUnite}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyles.font14BlackRegular,
      ),
      verticalSpace(5),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value,
              style: TextStyles.font14BlackBold,
            ),
            if (trailingIcon != null) Icon(trailingIcon, color: Colors.green),
            if (trailingUnite != null)
              Container(
                decoration: BoxDecoration(
                    color: ColorsManger.darkBlue,
                    borderRadius: BorderRadius.circular(6)),
                height: 31.h,
                width: 36.w,
                child: Center(
                  child: Text(
                    trailingUnite,
                    style: TextStyles.font12WhiteBold,
                  ),
                ),
              ),
          ],
        ),
      ),
    ],
  );
}
