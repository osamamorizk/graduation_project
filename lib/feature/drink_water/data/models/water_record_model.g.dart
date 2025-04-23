// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_record_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WaterRecordModelAdapter extends TypeAdapter<WaterRecordModel> {
  @override
  final int typeId = 1;

  @override
  WaterRecordModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WaterRecordModel(
      time: fields[0] as DateTime,
      amount: fields[1] as int,
      nextTime: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, WaterRecordModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.time)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.nextTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WaterRecordModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
