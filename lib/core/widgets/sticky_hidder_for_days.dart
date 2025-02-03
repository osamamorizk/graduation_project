import 'package:flutter/material.dart';

class StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  StickyHeaderDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: Material(
        color: Colors.white,
        elevation: 0,
        child: child,
      ),
    );
  }

  @override
  double get maxExtent => 35; // Adjust the height as needed
  @override
  double get minExtent => 30; // Keep min and max the same

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
