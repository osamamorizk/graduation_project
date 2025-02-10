import 'package:flutter/material.dart';
import 'package:graduation_project/core/widgets/day_container.dart';
import 'package:shimmer/shimmer.dart';

class DaysListShimmer extends StatelessWidget {
  const DaysListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade300,
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
