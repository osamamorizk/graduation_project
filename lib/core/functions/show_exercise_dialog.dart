import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/feature/workout/presentation/views/widgets/youtyube_video_player.dart';

void showExerciseVideoDialog(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return Dialog(
        insetAnimationCurve: Curves.elasticOut,
        insetAnimationDuration: const Duration(milliseconds: 500),
        backgroundColor: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: SizedBox(
          height: 230.h,
          width: 200.w,
          child: Stack(
            children: [
              Positioned(
                right: 2,
                top: -8,
                child: IconButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: (context.pop),
                    icon: const Icon(
                      Icons.close,
                    )),
              ),
              const Center(
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: YouTubeVideoPlayer(
                      videoUrl: 'https://www.youtube.com/embed/SNFj4cBJ6ds'),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
