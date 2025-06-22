import 'package:flutter/material.dart';

import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';

void showErrorDialog(BuildContext parentContext,
    {required String errorMessage}) {
  showDialog(
    context: parentContext,
    builder: (BuildContext context) {
      final isDark = Theme.of(context).brightness == Brightness.dark;
      return Dialog(
        insetAnimationCurve: Curves.elasticOut,
        insetAnimationDuration: const Duration(milliseconds: 200),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5,
        backgroundColor: isDark ? ColorsManger.darkCard : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 80,
              ),
              verticalSpace(16),
              Text(
                errorMessage,
                textAlign: TextAlign.center,
                style: isDark
                    ? TextStyles.font14WhiteBold
                    : TextStyles.font14BlackBold,
              ),
            ],
          ),
        ),
      );
    },
  );
}
