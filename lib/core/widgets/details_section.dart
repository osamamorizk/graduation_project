import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/themes/text_styles.dart';

class DetailsSection extends StatelessWidget {
  const DetailsSection({
    super.key,
    required this.title,
    required this.details,
  });
  final String title;
  final List<String> details;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyles.font16BlackBold),
        NumberedDetailsList(details),
      ],
    );
  }
}

class NumberedDetailsList extends StatelessWidget {
  final List<String> items;
  const NumberedDetailsList(this.items, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(items.length, (index) {
        return Padding(
          padding: EdgeInsets.only(top: 4.h),
          child: Text(
            '${index + 1}.  ${items[index]}',
            style: TextStyles.font14greyNormal,
          ),
        );
      }),
    );
  }
}
