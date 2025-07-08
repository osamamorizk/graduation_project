import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/functions/show_exercise_dialog.dart';
import 'package:graduation_project/core/widgets/custom_circle_progress_indicator.dart';
import 'package:graduation_project/core/widgets/error_view.dart';
import 'package:graduation_project/core/widgets/image_and_title_widget.dart';
import 'package:graduation_project/core/widgets/playing_video_widget.dart';
import 'package:graduation_project/core/widgets/calories_and_time.dart';
import 'package:graduation_project/feature/diet/data/models/gp_meal_details_model/gp_meal_details_model.dart';
import 'package:graduation_project/feature/diet/presentation/manger/cubit/diet_general_cubit.dart';
import 'package:graduation_project/feature/diet/presentation/views/widgets/general_plan_meal_info.dart';
import 'package:graduation_project/feature/diet/presentation/views/widgets/nutrition_info.dart';

class GenralPlanMealDetails extends StatelessWidget {
  const GenralPlanMealDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DietGeneralCubit, DietGeneralCubitState>(
        builder: (context, state) {
          if (state is GeneralDietCubitMealDetailsSuccess) {
            return GpMealDetailsBody(gpMealDetailsModel: state.dietMealDetails);
          } else if (state is GeneralDietCubitMealDetailsFailure) {
            return ErrorView(errorMessage: state.errorMessage);
          } else {
            return const CustomCircleProgressIndicator();
          }
        },
      ),
    );
  }
}

class GpMealDetailsBody extends StatelessWidget {
  const GpMealDetailsBody({
    super.key,
    required this.gpMealDetailsModel,
  });

  final GpMealDetailsModel gpMealDetailsModel;

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
            expandedHeight: 170,
            toolbarHeight: 0,
            flexibleSpace: FlexibleSpaceBar(
                background: ImageAndTitleWidget(
              errorImage:
                  'https://images.unsplash.com/photo-1498837167922-ddd27525d352',
              imageUrl: gpMealDetailsModel.imageUrl ?? '',
              name: gpMealDetailsModel.name ?? 'Meal name',
            )),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                CalorisAndTimeWidget(
                  title: 'min',
                  calories: gpMealDetailsModel.calories ?? 10,
                  duration: gpMealDetailsModel.time ?? 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NutritionItem(
                        title: 'Fat',
                        value: "${gpMealDetailsModel.macros?.fat ?? 10}"),
                    NutritionItem(
                        title: 'Protein',
                        value: "${gpMealDetailsModel.macros?.protein ?? 10}"),
                    NutritionItem(
                        title: 'Carbs',
                        value: "${gpMealDetailsModel.macros?.carbs ?? 10}"),
                  ],
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: GeneralPlanMealInformation(
                  gpMealDetailsModel: gpMealDetailsModel),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: PlayingVideoWidget(
          onTap: () {
            showExerciseVideoDialog(context,
                videoUrl:
                    'https://www.youtube.com/watch?v=eA-jzXKw2Aw&ab_channel=5-MinuteCra');
          },
        ),
      ),
    );
  }
}
