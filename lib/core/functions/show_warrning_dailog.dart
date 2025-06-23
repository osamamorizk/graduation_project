import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';

Future<dynamic> warningDialog(
    BuildContext context, void Function()? onPressed, String? message,
    {String? type}) {
  return showDialog(
    builder: (context) => AlertDialog(
      backgroundColor: Colors.white,
      actionsAlignment: MainAxisAlignment.center,
      title: Text(message ?? ' create new $type plan ?',
          textAlign: TextAlign.center, style: TextStyles.font22Bold),
      content: Text('You will lost the current plan',
          textAlign: TextAlign.center, style: TextStyles.font16Regular),
      actions: <Widget>[
        ElevatedButton(
          style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.white),
              side: WidgetStatePropertyAll(
                  BorderSide(color: ColorsManger.darkBlue, width: .3))),
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
            'New Plan',
            style: TextStyles.font14WhiteBold,
          ),
        ),
      ],
    ),
    context: context,
  );
}
