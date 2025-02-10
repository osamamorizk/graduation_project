part of 'scan_food_cubit.dart';

@immutable
sealed class ScanFoodState {}

final class ScanFoodInitial extends ScanFoodState {}

final class ScanFoodLoading extends ScanFoodState {}

final class ScanFoodSuccess extends ScanFoodState {
  final List<ScanFoodModel> scanFoodList;

  ScanFoodSuccess({required this.scanFoodList});
}

final class ScanFoodFailure extends ScanFoodState {
  final String errorMessage;

  ScanFoodFailure({required this.errorMessage});
}
