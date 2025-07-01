part of 'scan_food_cubit.dart';

@immutable
sealed class ScanFoodState {}

final class ScanFoodInitial extends ScanFoodState {}

final class ScanFoodLoading extends ScanFoodState {}

final class ScanFoodSuccess extends ScanFoodState {
  final List<Item> scanFoodList;

  ScanFoodSuccess({required this.scanFoodList});
}

final class ScanFoodFailure extends ScanFoodState {
  final String errorMessage;

  ScanFoodFailure({required this.errorMessage});
}

class ScanImagePicked extends ScanFoodState {
  final String imagePath;
  ScanImagePicked(this.imagePath);
}

class ScanCancelled extends ScanFoodState {}

class ScanError extends ScanFoodState {
  final String message;
  ScanError(this.message);
}
