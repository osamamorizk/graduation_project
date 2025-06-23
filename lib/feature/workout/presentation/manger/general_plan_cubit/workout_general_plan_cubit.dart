import 'package:bloc/bloc.dart';
import 'package:graduation_project/feature/workout/data/models/general_workout_p_lan_model/general_workout_p_lan_model.dart';
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
}
