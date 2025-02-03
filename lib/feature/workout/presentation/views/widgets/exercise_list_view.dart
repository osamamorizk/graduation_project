import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/core/widgets/error_view.dart';
import 'package:graduation_project/core/widgets/shimmer_loading.dart';
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
      body: RefreshIndicator(
        color: Colors.white,
        backgroundColor: ColorsManger.darkBlue,
        onRefresh: () {
          return context.read<ExerciseCubit>().getExerciseList(id: 15);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Builder(builder: (context) {
            return BlocBuilder<ExerciseCubit, ExerciseState>(
              builder: (context, state) {
                if (state is ExerciseSuccess) {
                  return ListView.builder(
                    itemCount: state.exerciseList.length,
                    itemBuilder: (context, index) =>
                        ExerciseItem(exerciseModel: state.exerciseList[index]),
                  );
                }
                if (state is ExerciseFailure) {
                  return ListView(
                    children: [
                      ErrorView(errorMessage: state.errorMessage),
                    ],
                  );
                } else {
                  return const ShimmerLoadingWidget(
                    itemCount: 6,
                    hight: 80,
                  );
                }
              },
            );
          }),
        ),
      ),
    );
  }
}
