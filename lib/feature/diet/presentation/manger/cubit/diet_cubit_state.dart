part of 'diet_cubit_cubit.dart';

@immutable
sealed class DietCubitState {}

final class DietCubitInitial extends DietCubitState {}

final class GetAllDietLoading extends DietCubitState {}

final class GetAllDietSuccess extends DietCubitState {}

final class GetAllDietFailure extends DietCubitState {}

//

final class GetMealsByDayLoading extends DietCubitState {}

final class GetMealsByDaySuccess extends DietCubitState {}

final class GetMealsByDayFailure extends DietCubitState {}
