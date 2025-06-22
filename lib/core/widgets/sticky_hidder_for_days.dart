import 'package:flutter/material.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';

class StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  StickyHeaderDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SizedBox.expand(
      child: Material(
        color: isDark ? ColorsManger.darkBackground : Colors.white,
        elevation: 0,
        child: child,
      ),
    );
  }

  @override
  double get maxExtent => 50;
  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
