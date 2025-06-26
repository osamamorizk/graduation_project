import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:gal/gal.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/feature/scan_food/presentation/views/widgets/camera_button.dart';
import 'package:graduation_project/feature/scan_food/presentation/views/widgets/image_preview.dart';
import 'package:image_picker/image_picker.dart';

class CameraBodyDetails extends StatelessWidget {
  const CameraBodyDetails({
    super.key,
    required this.cameraController,
  });

  final CameraController? cameraController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(child: CameraPreview(cameraController!)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40.h),
              child: Text(
                'Scan your meal',
                style: TextStyles.font13whiteRegular.copyWith(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: IconButton(
                        onPressed: () => pickImageFromGallery(context),
                        icon: const Icon(
                          size: 26,
                          FontAwesomeIcons.images,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  CameraButton(
                    onTap: () async {
                      XFile picture = await cameraController!.takePicture();
                      Gal.putImage(picture.path);
                      if (File(picture.path).existsSync()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ImagePreviewScreen(
                              imagePath: picture.path,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  const Expanded(child: SizedBox()),
                ],
              ),
            ),
            verticalSpace(15),
          ],
        ),
      ],
    );
  }
}

void pickImageFromGallery(BuildContext context) async {
  final ImagePicker picker = ImagePicker();
  try {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null && image.path.isNotEmpty) {
      if (File(image.path).existsSync()) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImagePreviewScreen(imagePath: image.path),
          ),
        );
      }
    }
  } catch (e) {
    debugPrint("Error picking image: $e");
  }
}
