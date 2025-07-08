import 'package:flutter/material.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';

class CameraButton extends StatelessWidget {
  final VoidCallback onTap;

  const CameraButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: isDarkMode ? ColorsManger.darkCard : Colors.white,
              width: 2),
        ),
        child: CircleAvatar(
          radius: 38,
          backgroundColor: Colors.transparent,
          child: CircleAvatar(
            radius: 35,
            backgroundColor: isDarkMode ? ColorsManger.darkCard : Colors.white,
            child: Icon(
              Icons.camera_alt,
              color:
                  isDarkMode ? ColorsManger.neonPurple : ColorsManger.darkBlue,
              size: 32,
            ),
          ),
        ),
      ),
    );
  }
}
