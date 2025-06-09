import 'package:flutter/material.dart';
import 'package:graduation_project/core/widgets/day_container.dart';
import 'package:shimmer/shimmer.dart';

class DaysListShimmer extends StatelessWidget {
  const DaysListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final baseColor = isDarkMode ? Colors.grey.shade800 : Colors.grey.shade100;
    final highlightColor =
        isDarkMode ? Colors.grey.shade700 : Colors.grey.shade300;
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return const DayContainer(day: 'day say ', isSelected: false);
        },
      ),
    );
  }
}
