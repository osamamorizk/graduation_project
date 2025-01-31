part of 'diet_cubit_cubit.dart';

@immutable
sealed class DietCubitState {}

final class DietCubitInitial extends DietCubitState {}

final class GetAllDietLoading extends DietCubitState {}

final class GetAllDietSuccess extends DietCubitState {
  final List<DailyPlan> allDietList;

  GetAllDietSuccess({required this.allDietList});
}

final class GetAllDietFailure extends DietCubitState {
  final String errorMessage;

  GetAllDietFailure({required this.errorMessage});
}

//

final class GetMealsByDayLoading extends DietCubitState {}

final class GetMealsByDaySuccess extends DietCubitState {
  final List<Meal> dayMeals;

  GetMealsByDaySuccess({required this.dayMeals});
}

final class GetMealsByDayFailure extends DietCubitState {
  final String errorMessage;

  GetMealsByDayFailure({required this.errorMessage});
}
