import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/core/widgets/custom_circle_progress_indicator.dart';
import 'package:graduation_project/feature/workout/presentation/manger/exercise_cubit/exercise_cubit.dart';
import 'package:graduation_project/feature/workout/presentation/views/widgets/exercise_item.dart';

class ExerciseListView extends StatelessWidget {
  const ExerciseListView({
    super.key,
    required this.exerciseGroup,
  });
  final String exerciseGroup;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 45,
        titleSpacing: 0,
        title: Text(
          '$exerciseGroup Exercises',
          style: TextStyles.font20BlueRegular,
        ),
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.black, size: 22),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocBuilder<ExerciseCubit, ExerciseState>(
          builder: (context, state) {
            if (state is ExerciseSuccess) {
              return ListView.builder(
                itemBuilder: (context, index) => ExerciseItem(
                  exerciseModel: state.exerciseList[index],
                ),
                itemCount: state.exerciseList.length,
              );
            } else if (state is ExerciseFailure) {
              return Text(state.errorMessage);
            } else {
              return const CustomCircleProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
