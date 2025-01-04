import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gal/gal.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/text_styles.dart';

class CameraWindow extends StatefulWidget {
  const CameraWindow({super.key});

  @override
  State<CameraWindow> createState() => _CameraWindowState();
}

class _CameraWindowState extends State<CameraWindow>
    with WidgetsBindingObserver {
  List<CameraDescription> availableCamera = [];
  CameraController? cameraController;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (cameraController == null ||
        cameraController?.value.isInitialized == false) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      cameraController?.dispose();
    } else if (state == AppLifecycleState.resumed) {
      setupCameraController();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    cameraController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    setupCameraController();
    super.initState();
  }

  Future<void> setupCameraController() async {
    List<CameraDescription> cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      setState(() {
        availableCamera = cameras;
        cameraController = CameraController(
          cameras.first,
          ResolutionPreset.high,
        );
      });
      cameraController?.initialize().then((_) {
        if (!mounted) return;
        setState(() {});
      }).catchError((Object e) {
        debugPrint('Error initializing camera: $e');
      });
    }
  }

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
                        style: TextStyles.font16whiteRegular
                            .copyWith(fontSize: 18),
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
