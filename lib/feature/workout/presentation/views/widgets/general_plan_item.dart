import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/feature/workout/data/models/general_workout_plan_models/general_workout_plan_model.dart';

class GeneralPlanItem extends StatelessWidget {
  const GeneralPlanItem({
    super.key,
    required this.generalPLanModel,
  });

  final GeneralWorkoutPLanModel generalPLanModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 118.h,
      width: MediaQuery.sizeOf(context).width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          alignment: Alignment.topRight,
          image: CachedNetworkImageProvider(
            generalPLanModel.imageUrl ?? '',
          ),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.black.withOpacity(.5),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                generalPLanModel.name ?? '',
                style: TextStyles.font16whiteBold,
              ),
              verticalSpace(12),
              Row(
                spacing: 15,
                children: [
                  Text(
                    "${generalPLanModel.exerciseCount} Exercises",
                    style: TextStyles.font16whiteRegular,
                  ),
                  Text(
                    generalPLanModel.difficulty ?? 'Easy',
                    style: TextStyles.font16whiteRegular,
                  ),
                  Text(
                    ' ${generalPLanModel.duration ?? 30} days',
                    style: TextStyles.font16whiteRegular,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
