import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/feature/workout/data/models/general_workout_plan_models/general_plan_details_model/exercise.dart';
import 'package:graduation_project/feature/workout/presentation/manger/general_plan_cubit/workout_general_plan_cubit.dart';

class TitleAndTimeWidget extends StatelessWidget {
  const TitleAndTimeWidget({
    super.key,
    required this.title,
    required this.exercise,
  });

  final String title;
  final List<Exercise> exercise;
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
          side: const BorderSide(color: ColorsManger.darkerGrey, width: .2),
          borderRadius: BorderRadius.circular(14)),
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: ColorsManger.darkBlue, width: .2),
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
      children: [
        SizedBox(
          height: exercise.length * 60.h,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: exercise.length,
            itemBuilder: (context, index) {
              final e = exercise[index];
              return GestureDetector(
                onTap: () {
                  context.pushNamed(Routes.workoutExerciseDetails);
                  context
                      .read<WorkoutGeneralPlanCubit>()
                      .getWorkoutExerciseDetails(
                        id: e.id ?? -70,
                      );
                },
                child: ListTile(
                  minTileHeight: 50.h,
                  title: Text(
                    "${index + 1}- ${e.name}",
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
          ),
        )
      ],
    );
  }
}
