import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingWidget extends StatelessWidget {
  const ShimmerLoadingWidget({
    super.key,
    this.hight,
    this.itemCount,
  });
  final double? hight;
  final int? itemCount;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade200,
        highlightColor: Colors.grey.shade400,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: itemCount ?? 4,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: ColorsManger.darkerGrey, width: .6),
              ),
              child: Row(
                children: [verticalSpace(hight ?? 40)],
              ),
            );
          },
        ),
      ),
    );
  }
}
