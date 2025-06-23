import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/core/widgets/custom_circle_progress_indicator.dart';
import 'package:graduation_project/feature/scan_food/presentation/views/widgets/camera_body_details.dart';

class ScanFoodUI extends StatelessWidget {
  final CameraController? cameraController;
  const ScanFoodUI({super.key, required this.cameraController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cameraController == null || !cameraController!.value.isInitialized
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomCircleProgressIndicator(),
                verticalSpace(16),
                Text(
                  'Loading Camera',
                  style: TextStyles.font16BlueBold,
                ),
              ],
            )
          : CameraBodyDetails(cameraController: cameraController),
    );
  }
}
