import 'package:flutter/material.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, required this.text});
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return ElevatedButton(
      style: ButtonStyle(
          shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
          backgroundColor: WidgetStateProperty.all(
            isDark ? ColorsManger.neonPurple : ColorsManger.darkBlue,
          ),
          minimumSize: const WidgetStatePropertyAll(Size(double.infinity, 50))),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyles.font16whiteBold,
      ),
    );
  }
}
