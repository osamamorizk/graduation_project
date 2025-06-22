import 'package:bloc/bloc.dart';

import 'package:graduation_project/feature/diet/data/models/diet_plan_model/diet_plan_model.dart';
import 'package:graduation_project/feature/diet/data/models/diet_plan_model/meal.dart';
import 'package:graduation_project/feature/diet/data/repos/diet_repo.dart';
import 'package:meta/meta.dart';

part 'diet_cubit_state.dart';

class DietCubit extends Cubit<DietCubitState> {
  DietCubit(this.dietRepo) : super(DietCubitInitial());
  final DietRepo dietRepo;
  Future<void> getAllDietsPlan() async {
    emit(GetAllDietLoading());
    var result = await dietRepo.getAllDiet();
    result.fold(
      (failure) {
        emit(GetAllDietFailure(errorMessage: failure.errorMessage));
        emit(GetMealsByDayFailure(errorMessage: failure.errorMessage));
      },
      (allDietList) {
        emit(GetAllDietSuccess(allDietList: allDietList));
        getMealsByDay(day: allDietList[0].day ?? 'saturday');
      },
    );
  }

  Future<void> getMealsByDay({required String day}) async {
    var result = await dietRepo.getMealsByDay(day: day);
    result.fold(
      (failure) {
        emit(GetMealsByDayFailure(errorMessage: failure.errorMessage));
      },
      (dayMeals) {
        emit(GetMealsByDaySuccess(dayMeals: dayMeals));
      },
    );
  }
}
