import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/feature/scan_food/presentation/views/widgets/camera_ui.dart';

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
    return ScanFoodUI(cameraController: cameraController);
  }
}
