import 'package:flutter/material.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            thickness: .5,
            color: ColorsManger.grey,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text('OR',
              style: TextStyles.font14greyNormal
                  .copyWith(fontWeight: FontWeight.bold)),
        ),
        const Expanded(
          child: Divider(
            thickness: .5,
            color: ColorsManger.grey,
          ),
        ),
      ],
    );
  }
}
