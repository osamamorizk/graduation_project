part of 'water_record_cubit.dart';

@immutable
sealed class WaterRecordState {}

final class WaterRecordInitial extends WaterRecordState {}

final class WaterRecordSuccess extends WaterRecordState {
  final List<WaterRecordModel> waterRecordModel;

  WaterRecordSuccess({required this.waterRecordModel});
}
