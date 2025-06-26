import 'package:bloc/bloc.dart';
import 'package:graduation_project/feature/workout/data/models/workout_model/workout_plan_model.dart';
import 'package:graduation_project/feature/workout/data/models/workout_model/exercise.dart';
import 'package:graduation_project/feature/workout/data/repos/workout_repo/workout_repo.dart';
import 'package:meta/meta.dart';

part 'workout_state.dart';

class WorkoutCubit extends Cubit<WorkoutState> {
  WorkoutCubit(this.workoutRepo) : super(WorkoutInitial());

  final WorkoutRepo workoutRepo;

  Future<void> getWorkoutPlans() async {
    emit(AllWorkoutLoading());
    var result = await workoutRepo.getAllWorkoutPlans();
    result.fold(
      (failure) {
        emit(AllWorkoutFailure(errorMessage: failure.errorMessage));
        emit(WorkoutByDayFailure(errorMessage: failure.errorMessage));
      },
      (workoutList) {
        emit(AllWorkoutSuccess(workoutPlansList: workoutList));
        getWorkoutByDay(day: workoutList[0].day ?? 'Day1');
      },
    );
  }

  Future<void> changeWorkoutPlans() async {
    emit(AllWorkoutLoading());
    var result = await workoutRepo.changeWorkoutPlan();
    result.fold(
      (failure) {
        emit(AllWorkoutFailure(errorMessage: failure.errorMessage));
        emit(WorkoutByDayFailure(errorMessage: failure.errorMessage));
      },
      (workoutList) {
        emit(AllWorkoutSuccess(workoutPlansList: workoutList));
        getWorkoutByDay(day: workoutList[0].day ?? 'Day1');
      },
    );
  }

  Future<void> getWorkoutByDay({required String day}) async {
    var result = await workoutRepo.getWorkoutByDay(day: day);

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
