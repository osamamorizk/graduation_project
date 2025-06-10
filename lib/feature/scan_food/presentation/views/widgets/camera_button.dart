import 'package:flutter/material.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';

class CameraButton extends StatelessWidget {
  final VoidCallback onTap;

  const CameraButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: const CircleAvatar(
          radius: 38,
          backgroundColor: Colors.transparent,
          child: CircleAvatar(
            radius: 35,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.camera_alt,
              color: ColorsManger.darkBlue,
              size: 32,
            ),
          ),
        ),
      ),
    );
  }
}
