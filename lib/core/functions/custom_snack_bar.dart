import 'package:flutter/material.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';

SnackBar cuatomSnackBar({required String text}) {
  return SnackBar(
    content: Center(
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    ),
    backgroundColor: ColorsManger.darkBlue,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.only(
      bottom: 100,
      left: 40,
      right: 40,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    duration: const Duration(seconds: 3),
  );
}
