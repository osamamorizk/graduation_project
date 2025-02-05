import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/text_styles.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key, required this.errorMessage});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 1.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            Assets.imagesSadMan,
            height: 150,
          ),
          verticalSpace(20),
          Text(
            errorMessage,
            style: TextStyles.font16BlackRegular,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
