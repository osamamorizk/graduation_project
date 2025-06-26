import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/helpers/const.dart';
import 'package:graduation_project/core/helpers/errors.dart';
import 'package:graduation_project/feature/drink_water/data/models/water_record_model.dart';
import 'package:graduation_project/feature/drink_water/data/repos/water_repo.dart';
import 'package:hive/hive.dart';

class WaterRepoImpl implements WaterRepo {
  @override
  Either<Failure, void> addWaterRecord(int amount) {
    final waterRecordBox = Hive.box<WaterRecordModel>(kWaterRimenderBox);

    try {
      final now = DateTime.now();
      final nextTime = now.add(const Duration(hours: 1));

      final record = WaterRecordModel(
        time: now,
        amount: amount,
        nextTime: nextTime,
      );
      waterRecordBox.add(record);
      return right(null);
    } catch (e) {
      return Left(
        Failure(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Either<Failure, List<WaterRecordModel>> featchWaterRecords() {
    final waterRecordBox = Hive.box<WaterRecordModel>(kWaterRimenderBox);

    try {
      final records = waterRecordBox.values.toList().reversed.toList();
      return Right(records);
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }
}
