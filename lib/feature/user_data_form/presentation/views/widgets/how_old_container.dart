import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/helpers/spacing.dart';

class HowOldContainer extends StatelessWidget {
  const HowOldContainer({
    super.key,
    required this.age,
  });

  final int age;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'How old are you?',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        verticalSpace(4),
        Container(
          decoration: BoxDecoration(border: Border.all(width: .4)),
          height: 40.h,
          width: 100.w,
          child: Center(
            child: Text(
              '$age',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
      ],
    );
  }
}
