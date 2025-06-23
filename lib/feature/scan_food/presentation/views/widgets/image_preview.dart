import 'dart:io';
import 'package:flutter/material.dart';
import 'package:graduation_project/feature/scan_food/presentation/views/widgets/image_preview_actions.dart';
import 'package:graduation_project/feature/scan_food/presentation/views/widgets/scan_food_listner.dart';

class ImagePreviewScreen extends StatelessWidget {
  final String imagePath;

  const ImagePreviewScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: imgePreviewAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            AspectRatio(
              aspectRatio: 1,
              child: SizedBox(
                child: Image.file(
                  File(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Spacer(flex: 2),
            ImagePreviewActions(imagePath: imagePath),
            const Spacer(flex: 2),
            ScanFoodListner(
              imagePath: imagePath,
            )
          ],
        ),
      ),
    );
  }

  AppBar imgePreviewAppBar(BuildContext context) {
    return AppBar(
      // iconTheme: const IconThemeData(color: ColorsManger.darkBlue, size: 22),
      titleSpacing: 0,
      toolbarHeight: 50,
      elevation: .7,
      // backgroundColor: Colors.white,
      scrolledUnderElevation: .2,
      // actionsIconTheme: const IconThemeData(color: ColorsManger.darkBlue),
      centerTitle: false,
      title: Text('Preview Image',
          style: Theme.of(context).textTheme.titleLarge?.copyWith()),
    );
  }
}
