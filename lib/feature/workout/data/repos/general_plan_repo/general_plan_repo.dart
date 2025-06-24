import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/helpers/errors.dart';
import 'package:graduation_project/feature/workout/data/models/general_workout_plan_models/general_plan_details_model/general_plan_details_model.dart';
import 'package:graduation_project/feature/workout/data/models/general_workout_plan_models/general_plan_exercise_details_model.dart';
import 'package:graduation_project/feature/workout/data/models/general_workout_plan_models/general_workout_plan_model.dart';

abstract class GeneralPlanRepo {
  Future<Either<Failure, List<GeneralWorkoutPLanModel>>>
      getGeneralWorkoutPlans();

  Future<Either<Failure, GeneralWorkoutPlanDetailsModel>>
      getGeneralWorkoutPlanDetails({required int id});

  Future<Either<Failure, GeneralWorkoutExerciseDetailsModel>>
      getWorkoutExerciseDetails({required int id});
}
