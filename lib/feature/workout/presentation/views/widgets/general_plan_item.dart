import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/core/widgets/custom_circle_progress_indicator.dart';
import 'package:graduation_project/feature/workout/data/models/general_workout_plan_models/general_workout_plan_model.dart';

class GenneralPlanWorkoutColllection extends StatelessWidget {
  const GenneralPlanWorkoutColllection({
    super.key,
    required this.generalPLanModel,
  });

  final GeneralWorkoutPLanModel generalPLanModel;

  static const String fallbackImageUrl =
      'https://images.unsplash.com/photo-1498837167922-ddd27525d352';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      width: MediaQuery.sizeOf(context).width * .9,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          CachedNetworkImage(
            imageUrl: generalPLanModel.imageUrl ?? fallbackImageUrl,
            fit: BoxFit.cover,
            placeholder: (context, url) =>
                const CustomCircleProgressIndicator(),
            errorWidget: (context, url, error) => CachedNetworkImage(
              imageUrl: fallbackImageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.6),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  generalPLanModel.name ?? 'Diet Plan',
                  style: TextStyles.font16whiteBold,
                ),
                SizedBox(height: 4.h),
                Text(
                  'Category: ${generalPLanModel.category ?? 'N/A'}',
                  style: TextStyles.font14WhiteBold.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
