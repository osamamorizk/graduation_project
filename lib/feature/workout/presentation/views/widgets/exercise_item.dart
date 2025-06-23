import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:graduation_project/core/functions/show_exercise_dialog.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/feature/workout/data/models/exercise_model.dart';

class ExerciseItem extends StatelessWidget {
  const ExerciseItem({super.key, required this.exerciseModel});
  final ExerciseModel exerciseModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showExerciseVideoDialog(context, videoUrl: exerciseModel.videoUrl);
      },
      child: Container(
        height: 120.h,
        decoration: const BoxDecoration(
            border: BorderDirectional(
                bottom: BorderSide(width: .2, color: Colors.grey))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: CachedNetworkImage(
                  fit: BoxFit.fitHeight,
                  imageUrl: exerciseModel.image,
                  placeholder: (context, url) => const Center(
                    child: SpinKitSpinningLines(
                      color: ColorsManger.darkBlue,
                      size: 30.0,
                      itemCount: 3,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            horizontalSpace(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    softWrap: true,
                    exerciseModel.name,
                    style: TextStyles.font16Bold,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  verticalSpace(8),
                  Text(
                    exerciseModel.sets,
                    style: TextStyles.font16Regular,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
