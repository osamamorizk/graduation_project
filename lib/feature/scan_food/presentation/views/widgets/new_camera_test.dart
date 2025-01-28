import 'dart:io';

// import 'package:better_open_file/better_open_file.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/feature/scan_food/presentation/views/widgets/image_preview.dart';

class NewCameraTest extends StatelessWidget {
  const NewCameraTest({super.key});

  @override
  Widget build(BuildContext context) {
    return CameraAwesomeBuilder.awesome(
      progressIndicator: const Text('Loading Camera'),
      sensorConfig: SensorConfig.single(
          sensor: Sensor.position(
        SensorPosition.back,
      )),
      topActionsBuilder: (state) {
        return AwesomeTopActions(
          state: state,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          children: [
            AwesomeFlashButton(state: state),
            const Spacer(),
            Text(
              'Scan Your Male',
              style: TextStyles.font16whiteRegular.copyWith(fontSize: 20),
            ),
            const Spacer(flex: 2),
          ],
        );
      },
      middleContentBuilder: (state) {
        return const SizedBox.shrink();
      },
      bottomActionsBuilder: (state) {
        return AwesomeBottomActions(
          onMediaTap: (mediaCapture) {
            // OpenFile.open(mediaCapture.captureRequest.path);
          },
          padding: const EdgeInsets.only(bottom: 16),
          state: state,
        );
      },
      theme: AwesomeTheme(
        bottomActionsBackgroundColor: Colors.transparent,
        buttonTheme: AwesomeButtonTheme(
          rotateWithCamera: true,
        ),
      ),
      saveConfig: SaveConfig.photo(),
      onMediaCaptureEvent: (mediaCapture) {
        if (File(mediaCapture.captureRequest.path!).existsSync()) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImagePreviewScreen(
                imagePath: mediaCapture.captureRequest.path!,
              ),
            ),
          );
        }
      },
    );
  }
}
