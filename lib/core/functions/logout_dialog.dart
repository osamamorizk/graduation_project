import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';

Future<dynamic> logoutDialog(BuildContext context,
    {void Function()? onPressed}) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  return showDialog(
    builder: (context) => AlertDialog(
      elevation: 0,
      icon: const Icon(
        size: 60,
        Icons.warning_rounded,
        color: ColorsManger.darkBlue,
      ),
      actionsAlignment: MainAxisAlignment.center,
      content: Text('Do you want to logout ?',
          textAlign: TextAlign.center, style: TextStyles.font18Bold),
      actions: <Widget>[
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: const WidgetStatePropertyAll(Colors.white),
              side: WidgetStatePropertyAll(BorderSide(
                  color:
                      isDark ? ColorsManger.neonPurple : ColorsManger.darkBlue,
                  width: .3))),
          onPressed: () {
            context.pop();
          },
          child: Text(
            'Cancel',
            style: TextStyles.font14BlackBold,
          ),
        ),
        horizontalSpace(10),
        ElevatedButton(
          style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(ColorsManger.darkBlue)),
          onPressed: onPressed,
          child: Text(
            'Log out',
            style: TextStyles.font14WhiteBold,
          ),
        ),
      ],
    ),
    context: context,
  );
}
