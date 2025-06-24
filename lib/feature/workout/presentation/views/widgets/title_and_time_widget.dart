import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/feature/workout/data/models/general_workout_plan_models/general_plan_details_model/exercise.dart';

class TitleAndTimeWidget extends StatelessWidget {
  const TitleAndTimeWidget({
    super.key,
    required this.title,
    required this.exercise,
    this.onTap,
  });

  final String title;
  final List<Exercise> exercise;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return ExpansionTile(
      initiallyExpanded: true,
      backgroundColor: isDarkMode ? ColorsManger.darkCard : Colors.white,
      childrenPadding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      collapsedShape: RoundedRectangleBorder(
          side: const BorderSide(color: ColorsManger.darkerGrey, width: .1),
          borderRadius: BorderRadius.circular(14)),
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: ColorsManger.darkBlue, width: .1),
          borderRadius: BorderRadius.circular(14)),
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(fontSize: 14.sp, fontWeight: FontWeight.w700),
      ),
      // trailing: FittedBox(
      //   child: Row(
      //     spacing: 5,
      //     children: [
      //       SvgPicture.asset(
      //         colorFilter: ColorFilter.mode(
      //           isDarkMode ? ColorsManger.neonPurple : ColorsManger.darkBlue,
      //           BlendMode.srcIn,
      //         ),
      //         Assets.svgsClock,
      //         height: 18,
      //       ),
      //       Text(
      //         '10 min',
      //         style: Theme.of(context)
      //             .textTheme
      //             .bodySmall
      //             ?.copyWith(fontWeight: FontWeight.normal),
      //       )
      //     ],
      //   ),
      // ),
      children: exercise.map(
        (e) {
          return GestureDetector(
            onTap: onTap,
            child: ListTile(
              minTileHeight: 50.h,
              title: Text(
                e.name ?? 'Exercise',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 13.sp,
                    ),
              ),
              trailing: Text(
                '${e.sets} sets',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 12.sp,
                      color: ColorsManger.grey,
                    ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
