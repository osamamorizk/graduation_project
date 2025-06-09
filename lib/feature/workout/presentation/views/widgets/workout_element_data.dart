import 'package:flutter/material.dart';
import 'package:graduation_project/core/themes/text_styles.dart';

class WorkoutElementDataItem extends StatelessWidget {
  const WorkoutElementDataItem({
    super.key,
    required this.data1,
    required this.data2,
  });
  final String data1, data2;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data1,
          style: TextStyles.font14Regular,
        ),
        Text(
          data2,
          style: TextStyles.font14Regular,
        ),
      ],
    );
  }
}
