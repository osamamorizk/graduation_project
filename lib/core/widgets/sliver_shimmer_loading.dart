import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:shimmer/shimmer.dart';

class SliverShimmerLoading extends StatelessWidget {
  const SliverShimmerLoading({
    super.key,
    this.hight,
    this.itemCount,
  });
  final double? hight;
  final int? itemCount;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade200,
            highlightColor: Colors.grey.shade400,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: ColorsManger.darkerGrey, width: 0.6),
              ),
              child: Row(
                children: [
                  verticalSpace(hight ?? 40),
                ],
              ),
            ),
          );
        },
        childCount: itemCount ?? 4,
      ),
    );
  }
}
