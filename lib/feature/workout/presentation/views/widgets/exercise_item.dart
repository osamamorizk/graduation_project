import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:graduation_project/core/functions/show_exercise_dialog.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';

class ExerciseItem extends StatelessWidget {
  const ExerciseItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showExerciseVideoDialog(context);
      },
      child: Container(
        height: 120.h,
        decoration: const BoxDecoration(
            border: BorderDirectional(
                bottom: BorderSide(width: .3, color: Colors.grey))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.5,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                width: 80.w,
                imageUrl:
                    "https://img.youtube.com/vi/3DH2fwV5u1k/maxresdefault.jpg",
                placeholder: (context, url) => Center(
                  child: SpinKitSpinningLines(
                    color: ColorsManger.darkBlue,
                    size: 60.0,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            horizontalSpace(16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Squats',
                  style: TextStyles.font16BlackBold,
                ),
                verticalSpace(8),
                Text(
                  '30 min',
                  style: TextStyles.font16BlackRegular,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
