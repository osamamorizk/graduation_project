import 'dart:io';

// import 'package:better_open_file/better_open_file.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';

class ImagePreviewScreen extends StatelessWidget {
  final String imagePath;

  const ImagePreviewScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: ImgePreviewAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: Image.file(
                File(imagePath),
                fit: BoxFit.contain,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  style: const ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Colors.lightBlue)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.camera,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Retake',
                    style: TextStyles.font14WhiteBold
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                ),
                ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(ColorsManger.darkBlue)),
                  onPressed: () {
                    // OpenFile.open(imagePath);
                  },
                  icon: const Icon(
                    Icons.compare,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Scan Food',
                    style: TextStyles.font14WhiteBold
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
            verticalSpace(50),
          ],
        ),
      ),
    );
  }

  AppBar ImgePreviewAppBar() {
    return AppBar(
      toolbarHeight: 50,
      elevation: .5,
      backgroundColor: Colors.white,
      scrolledUnderElevation: .2,
      actionsIconTheme: IconThemeData(color: ColorsManger.darkBlue),
      centerTitle: true,
      title: Text(
        'Preview Image',
        style: TextStyles.font16BlackRegular.copyWith(fontSize: 20),
      ),
    );
  }
}
