import 'package:bloc/bloc.dart';
import 'package:graduation_project/feature/diet/data/models/diet/daily_plan.model.dart';
import 'package:graduation_project/feature/diet/data/models/diet/meal.model.dart';
import 'package:graduation_project/feature/diet/data/repos/diet_repo.dart';
import 'package:meta/meta.dart';

part 'diet_cubit_state.dart';

class DietCubitCubit extends Cubit<DietCubitState> {
  DietCubitCubit(this.dietRepo) : super(DietCubitInitial());
  final DietRepo dietRepo;
  Future<void> getAllDietsPlan() async {
    emit(GetAllDietLoading());
    var result = await dietRepo.getAllDiet();
    result.fold(
      (failure) {
        emit(GetAllDietFailure(errorMessage: failure.errorMessage));
      },
      (allDietList) {
        emit(GetAllDietSuccess(allDietList: allDietList));
        getMealsByDay(day: allDietList[0].day ?? 'day');
      },
    );
  }

  Future<void> getMealsByDay({required String day}) async {
    emit(GetAllDietLoading());
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
