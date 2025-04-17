import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/themes/text_styles.dart';

class ImageAndTitleWidget extends StatelessWidget {
  const ImageAndTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          alignment: Alignment.topCenter,
          fit: BoxFit.fitWidth,
          width: double.infinity,
          Assets.imagesGeneralPlansGenralWorkout,
          height: 300,
        ),
        Positioned(
          top: 50,
          left: 10,
          child: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          top: 90,
          left: 20,
          child: Text(
            'Muscle Gain (Hypotrophy)',
            style: TextStyles.font16whiteBold.copyWith(
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
