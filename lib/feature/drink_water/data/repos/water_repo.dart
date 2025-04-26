import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/helpers/errors.dart';
import 'package:graduation_project/feature/drink_water/data/models/water_record_model.dart';

abstract class WaterRepo {
  Either<Failure, void> addWaterRecord(int amount);
  Either<Failure, List<WaterRecordModel>> featchWaterRecords();
}
