import 'package:flutter/material.dart';

import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/core/widgets/custom_circle_progress_indicator.dart';

void showLoadingDialog(BuildContext parentContext,
    {required String loadingMessage}) {
  showDialog(
    barrierDismissible: false,
    context: parentContext,
    builder: (BuildContext context) {
      return Dialog(
        insetAnimationCurve: Curves.elasticOut,
        insetAnimationDuration: const Duration(milliseconds: 200),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5,
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const CustomCircleProgressIndicator(),
              verticalSpace(16),
              Text(
                loadingMessage,
                style: TextStyles.font14BlueRegular,
              ),
            ],
          ),
        ),
      );
    },
  );
}
