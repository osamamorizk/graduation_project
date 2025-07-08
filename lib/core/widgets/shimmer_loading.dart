import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingWidget extends StatelessWidget {
  const ShimmerLoadingWidget({
    super.key,
    this.height,
    this.itemCount,
    this.padding,
  });

  final double? height;
  final int? itemCount;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final baseColor = isDarkMode ? Colors.grey.shade800 : Colors.grey.shade100;
    final highlightColor =
        isDarkMode ? Colors.grey.shade700 : Colors.grey.shade300;

    return ListView.builder(
      itemCount: itemCount ?? 4,
      itemBuilder: (context, index) => Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: padding ?? 0, vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          decoration: BoxDecoration(
            color: isDarkMode ? Colors.grey.shade900 : Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: ColorsManger.darkerGrey,
              width: 0.6,
            ),
          ),
          child: Row(
            children: [verticalSpace(height ?? 40)],
          ),
        ),
      ),
    );
  }
}
