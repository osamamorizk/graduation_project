import 'package:flutter/material.dart';

import 'package:graduation_project/feature/scan_food/presentation/views/widgets/new_camera_test.dart';

class ScanFoodView extends StatelessWidget {
  const ScanFoodView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: NewCameraTest()

        // CameraWindow(),
        );
  }
}
