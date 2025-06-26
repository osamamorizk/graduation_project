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

final class GeneralDietCubitDetailsSuccess extends DietGeneralCubitState {
  final DietGpDetailsModel dietPlanDetails;

  GeneralDietCubitDetailsSuccess(this.dietPlanDetails);
}

final class GeneralDietCubitDetailsFailure extends DietGeneralCubitState {
  final String errorMessage;

  GeneralDietCubitDetailsFailure(this.errorMessage);
}

final class GeneralDietCubitDetailsLoading extends DietGeneralCubitState {}

final class GeneralDietCubitMealDetailsSuccess extends DietGeneralCubitState {
  final GpMealDetailsModel dietMealDetails;

  GeneralDietCubitMealDetailsSuccess(this.dietMealDetails);
}

final class GeneralDietCubitMealDetailsFailure extends DietGeneralCubitState {
  final String errorMessage;

  GeneralDietCubitMealDetailsFailure(this.errorMessage);
}

final class GeneralDietCubitMealDetailsLoading extends DietGeneralCubitState {}
