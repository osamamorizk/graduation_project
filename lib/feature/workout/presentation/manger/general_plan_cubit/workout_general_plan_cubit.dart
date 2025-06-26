import 'package:bloc/bloc.dart';
import 'package:graduation_project/feature/workout/data/models/general_workout_plan_models/general_plan_details_model/general_plan_details_model.dart';
import 'package:graduation_project/feature/workout/data/models/general_workout_plan_models/general_plan_exercise_details_model.dart';
import 'package:graduation_project/feature/workout/data/models/general_workout_plan_models/general_workout_plan_model.dart';
import 'package:graduation_project/feature/workout/data/repos/general_plan_repo/general_plan_repo.dart';
import 'package:meta/meta.dart';

part 'workout_general_plan_state.dart';

class WorkoutGeneralPlanCubit extends Cubit<WorkoutGeneralPlanState> {
  WorkoutGeneralPlanCubit(this.generalPlanRepo)
      : super(WorkoutGeneralPlanInitial());

  final GeneralPlanRepo generalPlanRepo;
  Future<void> getGeneralWorkoutPlan() async {
    emit(WorkoutGeneralPlanLoading());
    var result = await generalPlanRepo.getGeneralWorkoutPlans();
    result.fold(
      (failure) {
        emit(WorkoutGeneralPlanFailure(error: failure.errorMessage));
      },
      (success) {
        emit(WorkoutGeneralPlanSuccess(success));
      },
    );
  }

  Future<void> getGeneralWorkoutPlanDetails({required int id}) async {
    emit(GeneralWorkoutPlanDetailsLoading());
    var result = await generalPlanRepo.getGeneralWorkoutPlanDetails(id: id);
    result.fold(
      (failure) {
        emit(GeneralWorkoutPlanDetailsFailure(error: failure.errorMessage));
      },
      (success) {
        emit(GeneralWorkoutPlanDetailsSuccess(success));
      },
    );
  }

  Future<void> getWorkoutExerciseDetails({required int id}) async {
    emit(GeneralWorkoutExerciseDetailsLoading());
    var result = await generalPlanRepo.getWorkoutExerciseDetails(id: id);
    result.fold(
      (failure) {
        emit(GeneralWorkoutExerciseDetailsFailure(error: failure.errorMessage));
      },
      (success) {
        emit(GeneralWorkoutExerciseDetailsSuccess(success));
      },
    );
  }
}
