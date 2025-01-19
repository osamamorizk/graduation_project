import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';

Future<dynamic> warningDialog(BuildContext context) {
  return showDialog(
    builder: (context) => AlertDialog(
      backgroundColor: Colors.white,
      actionsAlignment: MainAxisAlignment.center,
      title: Text('Do you want to create new plan ?',
          textAlign: TextAlign.center, style: TextStyles.font22BlueBold),
      content: Text('You will lost the current plan',
          textAlign: TextAlign.center, style: TextStyles.font16BlackRegular),
      actions: <Widget>[
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: const WidgetStatePropertyAll(Colors.white),
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
          style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(ColorsManger.darkBlue)),
          onPressed: () {
            Navigator.of(context).pop;
          },
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
