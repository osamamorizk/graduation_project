import 'package:flutter/material.dart';

import 'package:graduation_project/feature/scan_food/presentation/views/widgets/camera_window.dart';

class ScanFoodView extends StatelessWidget {
  const ScanFoodView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CameraWindow(),
    );
  }
}
