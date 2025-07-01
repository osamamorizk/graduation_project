import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/core/widgets/custom_circle_progress_indicator.dart';
import 'package:graduation_project/feature/scan_food/presentation/views/widgets/camera_body_details.dart';
import 'package:permission_handler/permission_handler.dart';

class ScanFoodUI extends StatelessWidget {
  final CameraController? cameraController;
  final bool permissionDenied;

  const ScanFoodUI({
    super.key,
    required this.cameraController,
    this.permissionDenied = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: permissionDenied
          ? Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.warning_amber_rounded,
                        size: 64, color: Colors.red),
                    verticalSpace(16),
                    Text(
                      'Camera and microphone permissions is required to scan food.',
                      textAlign: TextAlign.center,
                      style: TextStyles.font16BlueBold,
                    ),
                    verticalSpace(16),
                    ElevatedButton(
                      onPressed: () {
                        openAppSettings();
                      },
                      child: const Text('Open App Settings'),
                    ),
                  ],
                ),
              ),
            )
          : (cameraController == null ||
                  !(cameraController!.value.isInitialized))
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
              : CameraBodyDetails(cameraController: cameraController!),
    );
  }
}
