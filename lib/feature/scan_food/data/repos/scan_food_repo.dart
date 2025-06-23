import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/helpers/errors.dart';
import 'package:graduation_project/feature/scan_food/data/models/new_food_model/item.dart';

abstract class ScanFoodRepo {
  Future<Either<Failure, List<Item>>> postScanFood({required String imagePath});
}
