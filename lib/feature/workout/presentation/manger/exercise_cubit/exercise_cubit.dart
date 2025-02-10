import 'package:bloc/bloc.dart';
import 'package:graduation_project/feature/workout/data/models/exercise_model.dart';
import 'package:graduation_project/feature/workout/data/repos/workout_repo.dart';
import 'package:meta/meta.dart';

part 'exercise_state.dart';

class ExerciseCubit extends Cubit<ExerciseState> {
  ExerciseCubit(this.workoutRepo) : super(ExerciseInitial());

  final WorkoutRepo workoutRepo;

  Future<void> getExerciseList({required int id}) async {
    emit(ExerciseLoading());
    var result = await workoutRepo.getExerciseList(id: id);
    result.fold(
      (failure) {
        emit(ExerciseFailure(errorMessage: failure.errorMessage));
      },
      (exerciseList) {
        emit(ExerciseSuccess(exerciseList: exerciseList));
      },
    );
  }
}
