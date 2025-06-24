import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/widgets/calories_and_time.dart';
import 'package:graduation_project/core/widgets/custom_circle_progress_indicator.dart';
import 'package:graduation_project/core/widgets/details_section.dart';
import 'package:graduation_project/core/widgets/image_and_title_widget.dart';
import 'package:graduation_project/core/widgets/playing_video_widget.dart';
import 'package:graduation_project/feature/workout/data/models/general_workout_plan_models/general_plan_exercise_details_model.dart';
import 'package:graduation_project/feature/workout/presentation/manger/general_plan_cubit/workout_general_plan_cubit.dart';
import 'package:graduation_project/feature/workout/presentation/views/widgets/level_category_widget.dart';

class ExerciseDetailsGeneralPlanWorkout extends StatelessWidget {
  const ExerciseDetailsGeneralPlanWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutGeneralPlanCubit, WorkoutGeneralPlanState>(
      builder: (context, state) {
        if (state is GeneralWorkoutExerciseDetailsSuccess) {
          return GPWorkoutExerciseDetailsBody(
            generalWorkoutExerciseDetailsModel: state.genralPlanDetails,
          );
        } else if (state is GeneralWorkoutExerciseDetailsFailure) {
          return Center(
            child: Text(
              state.error,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          );
        } else {
          return const Center(child: CustomCircleProgressIndicator());
        }
      },
    );
  }
}

class GPWorkoutExerciseDetailsBody extends StatelessWidget {
  const GPWorkoutExerciseDetailsBody({
    super.key,
    required this.generalWorkoutExerciseDetailsModel,
  });
  final GeneralWorkoutExerciseDetailsModel generalWorkoutExerciseDetailsModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            stretch: true,
            shadowColor: Colors.transparent,
            scrolledUnderElevation: 0,
            expandedHeight: 250,
            toolbarHeight: 0,
            flexibleSpace: FlexibleSpaceBar(
                background: ImageAndTitleWidget(
              name: generalWorkoutExerciseDetailsModel.name ??
                  'https://experiencelife.lifetime.life/wp-content/uploads/2023/04/jun23-bid-lateral-raise.jpg',
              imageUrl: generalWorkoutExerciseDetailsModel.imageUrl ?? '',
            )),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                CalorisAndTimeWidget(
                  calories: generalWorkoutExerciseDetailsModel.restTime ?? 0,
                  duration: generalWorkoutExerciseDetailsModel.duration ?? 0,
                ),
                LevelCategoryChips(
                  category:
                      generalWorkoutExerciseDetailsModel.targetMuscle ?? '',
                  level: generalWorkoutExerciseDetailsModel.difficulty ?? '',
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailsSection(
                    title: 'How to do',
                    details:
                        generalWorkoutExerciseDetailsModel.instructions ?? [],
                  ),
                  DetailsSection(
                      title: 'Benefits',
                      details:
                          generalWorkoutExerciseDetailsModel.benefits ?? []),
                  DetailsSection(
                      title: 'Tips',
                      details: generalWorkoutExerciseDetailsModel.tips ?? []),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: PlayingVideoWidget(
          videoUrl: generalWorkoutExerciseDetailsModel.videoUrl ??
              'https://www.youtube.com/watch?v=3VcKaXpzqRo',
        ),
      ),
    );
  }
}
