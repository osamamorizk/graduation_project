import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/helpers/errors.dart';
import 'package:graduation_project/feature/workout/data/models/general_workout_p_lan_model/general_workout_p_lan_model.dart';

abstract class GeneralPlanRepo {
  Future<Either<Failure, List<GeneralWorkoutPLanModel>>>
      getGeneralWorkoutPlans();
}
