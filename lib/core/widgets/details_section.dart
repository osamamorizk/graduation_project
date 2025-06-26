import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsSection extends StatelessWidget {
  const DetailsSection({
    super.key,
    required this.title,
    required this.details,
  });
  final String title;
  final List<dynamic> details;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 16.sp,
              ),
        ),
        NumberedDetailsList(details),
      ],
    );
  }
}

class NumberedDetailsList extends StatelessWidget {
  final List<dynamic> items;
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
            style: Theme.of(context).textTheme.bodySmall,
          ),
        );
      }),
    );
  }
}
