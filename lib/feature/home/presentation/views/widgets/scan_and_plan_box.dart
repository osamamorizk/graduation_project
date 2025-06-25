import 'package:flutter/material.dart';
import 'package:graduation_project/feature/home/presentation/views/widgets/hydration_box.dart';
import 'package:graduation_project/feature/home/presentation/views/widgets/plan_box.dart';
import 'package:graduation_project/feature/home/presentation/views/widgets/scan_food_box.dart';

class ScanAndPlanAndHydartionBox extends StatelessWidget {
  const ScanAndPlanAndHydartionBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(child: ScanFoodBox()),
        Expanded(child: HydrationBox()),
        Expanded(child: YourPlanBox()),
      ],
    );
  }
}
