import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gal/gal.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/text_styles.dart';

class ScanFoodUI extends StatelessWidget {
  const ScanFoodUI({
    super.key,
    required this.cameraController,
  });

  final CameraController? cameraController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cameraController == null || !cameraController!.value.isInitialized
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                SizedBox.expand(child: CameraPreview(cameraController!)),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 50.h),
                      child: Text(
                        'Scan your meal',
                        style:
                            TextStyles.font16whiteBold.copyWith(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Spacer(),
                    Center(
                        child: Image.asset(
                      color: Colors.white.withOpacity(.4),
                      scale: 1,
                      Assets.imagesCameraFrame2,
                    )),
                    const Spacer(),
                    IconButton(
                      onPressed: () async {
                        XFile picture = await cameraController!.takePicture();
                        Gal.putImage(picture.path);
                      },
                      icon: Image.asset(Assets.imagesCameraButton),
                    ),
                    verticalSpace(15),
                  ],
                ),
              ],
            ),
    );
  }
}
