import 'package:bloc/bloc.dart';
import 'package:graduation_project/feature/workout/data/models/workout_model/daily_plan.dart';
import 'package:graduation_project/feature/workout/data/models/workout_model/exercise.dart';
import 'package:graduation_project/feature/workout/data/repos/workout_repo.dart';
import 'package:meta/meta.dart';

part 'workout_state.dart';

class WorkoutCubit extends Cubit<WorkoutState> {
  WorkoutCubit(this.workoutRepo) : super(WorkoutInitial());

  final WorkoutRepo workoutRepo;

  Future<void> getWorkoutPlans() async {
    emit(AllWorkoutLoading());
    var result = await workoutRepo.getWorkoutPlans();
    result.fold(
      (failure) {
        emit(AllWorkoutFailure(errorMessage: failure.errorMessage));
      },
      (workoutList) {
        emit(AllWorkoutSuccess(workoutPlansList: workoutList));
      },
    );
  }

  Future<void> getWorkoutByDay({required String day}) async {
    var result = await workoutRepo.getDailyWorkout(day: day);

    result.fold(
      (failure) {
        emit(WorkoutByDayFailure(errorMessage: failure.errorMessage));
      },
      (dailyWorkoutList) {
        emit(WorkoutByDaySuccess(dailyWorkoutExercise: dailyWorkoutList));
      },
    );
  }
}
