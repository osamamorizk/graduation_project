part of 'diet_general_cubit.dart';

@immutable
sealed class DietGeneralCubitState {}

final class GeneralDietCubitInitial extends DietGeneralCubitState {}

final class GeneralDietCubitLoading extends DietGeneralCubitState {}

final class GeneralDietCubitFailure extends DietGeneralCubitState {
  final String errorMessage;

  GeneralDietCubitFailure(this.errorMessage);
}

final class GeneralDietCubitSuccess extends DietGeneralCubitState {
  final List<DietGpModel> dietPlans;

  GeneralDietCubitSuccess(this.dietPlans);
}
