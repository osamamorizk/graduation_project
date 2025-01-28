import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/feature/workout/presentation/views/widgets/youtyube_video_player.dart';

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
            Image.asset(
              Assets.imagesExerciseItem,
              width: 85.w,
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

void showExerciseVideoDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        insetAnimationCurve: Curves.elasticOut,
        insetAnimationDuration: const Duration(milliseconds: 200),
        backgroundColor: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: SizedBox(
          height: 250.h,
          width: 200.w,
          child: const FittedBox(
            fit: BoxFit.contain,
            child: YouTubeVideoPlayer(
                videoUrl: 'https://www.youtube.com/embed/-kHlqnBkzDw'),
          ),
        ),
      );
    },
  );
}
