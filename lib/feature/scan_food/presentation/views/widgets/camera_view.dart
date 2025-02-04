import 'dart:io';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/core/widgets/custom_circle_progress_indicator.dart';
import 'package:graduation_project/feature/scan_food/presentation/views/widgets/image_preview.dart';
import 'package:image_picker/image_picker.dart';

class CameraView extends StatelessWidget {
  const CameraView({super.key});

  @override
  Widget build(BuildContext context) {
    return CameraAwesomeBuilder.awesome(
      progressIndicator: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomCircleProgressIndicator(),
          verticalSpace(16),
          Text(
            'Loading Camera',
            style: TextStyles.font16BlueBold,
          ),
        ],
      ),
      sensorConfig: SensorConfig.single(
          aspectRatio: CameraAspectRatios.ratio_4_3,
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
        //  AwesomeFocusIndicator(position: Offset(0, 240),);
      },
      bottomActionsBuilder: (state) {
        return AwesomeBottomActions(
          left: const SizedBox.shrink(),
          right: IconButton(
            onPressed: () async {
              final ImagePicker picker = ImagePicker();

              final XFile? image =
                  await picker.pickImage(source: ImageSource.gallery);
              if (image != null && image.path.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImagePreviewScreen(
                      imagePath: image.path,
                    ),
                  ),
                );
              }
            },
            icon: const Icon(
              size: 30,
              FontAwesomeIcons.images,
              color: Colors.white,
            ),
          ),
          state: state,
          onMediaTap: (mediaCapture) {
            // OpenFile.open(mediaCapture.captureRequest.path);
          },
          padding: const EdgeInsets.only(bottom: 16),
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
