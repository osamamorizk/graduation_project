import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/helpers/errors.dart';
import 'package:graduation_project/feature/scan_food/data/models/scan_food_model.dart';

abstract class ScanFoodRepo {
  Future<Either<Failure, ScanFoodModel>> postScanFood(
      {required String imagePath});
}
