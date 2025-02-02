part of 'scan_food_cubit.dart';

@immutable
sealed class ScanFoodState {}

final class ScanFoodInitial extends ScanFoodState {}

final class ScanFoodLoading extends ScanFoodState {}

final class ScanFoodSuccess extends ScanFoodState {
  final ScanFoodModel scanFoodModel;

  ScanFoodSuccess({required this.scanFoodModel});
}

final class ScanFoodFailure extends ScanFoodState {
  final String errorMessage;

  ScanFoodFailure({required this.errorMessage});
}
