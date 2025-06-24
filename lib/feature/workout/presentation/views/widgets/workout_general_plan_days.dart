import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/widgets/calories_and_time.dart';
import 'package:graduation_project/core/widgets/custom_circle_progress_indicator.dart';
import 'package:graduation_project/core/widgets/error_view.dart';
import 'package:graduation_project/core/widgets/image_and_title_widget.dart';
import 'package:graduation_project/feature/workout/presentation/manger/general_plan_cubit/workout_general_plan_cubit.dart';
import 'package:graduation_project/feature/workout/presentation/views/widgets/title_and_time_widget.dart';

class WorkoutGeneralPlanDays extends StatelessWidget {
  const WorkoutGeneralPlanDays({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WorkoutGeneralPlanCubit, WorkoutGeneralPlanState>(
        builder: (context, state) {
          if (state is GeneralWorkoutPlanDetailsSuccess) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  ImageAndTitleWidget(
                    imageUrl: state.genralPlanDetails.imageUrl ?? "",
                    name: state.genralPlanDetails.name ?? '',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: -25,
                          left: MediaQuery.of(context).size.width / 20,
                          child: CalorisAndTimeWidget(
                            widget: Row(
                              children: [
                                const SizedBox(
                                  height: 12,
                                  child: VerticalDivider(
                                    thickness: 1.3,
                                    width: 15,
                                    color: ColorsManger.grey,
                                  ),
                                ),
                                Text(
                                  state.genralPlanDetails.difficulty ?? 'Easy',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                            calories:
                                state.genralPlanDetails.caloriesBurned ?? 0,
                            duration:
                                state.genralPlanDetails.exerciseCount ?? 10,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:
                                state.genralPlanDetails.days?.length ?? 0,
                            separatorBuilder: (context, index) => const Divider(
                              color: ColorsManger.lighterGrey,
                              thickness: .4,
                            ),
                            itemBuilder: (context, index) {
                              return TitleAndTimeWidget(
                                onTap: () {
                                  context
                                      .pushNamed(Routes.workoutExerciseDetails);
                                  context
                                      .read<WorkoutGeneralPlanCubit>()
                                      .getWorkoutExerciseDetails(
                                        id: state.genralPlanDetails.days?[index]
                                                .exercises?[index].id ??
                                            -70,
                                      );
                                },
                                title:
                                    state.genralPlanDetails.days?[index].name ??
                                        'Day',
                                exercise: state.genralPlanDetails.days?[index]
                                        .exercises ??
                                    [],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
          if (state is GeneralWorkoutPlanDetailsFailure) {
            return ListView(
              children: [
                ErrorView(errorMessage: state.error),
              ],
            );
          } else {
            return const CustomCircleProgressIndicator();
          }
        },
      ),
    );
  }
}
