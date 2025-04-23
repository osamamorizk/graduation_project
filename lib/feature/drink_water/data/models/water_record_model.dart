import 'package:hive/hive.dart';
part 'water_record_model.g.dart';

@HiveType(typeId: 1)
class WaterRecordModel extends HiveObject {
  @HiveField(0)
  final DateTime time;

  @HiveField(1)
  final int amount;
  @HiveField(2)
  final DateTime nextTime;

  WaterRecordModel({
    required this.time,
    required this.amount,
    required this.nextTime,
  });
}
