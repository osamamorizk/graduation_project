import 'package:bloc/bloc.dart';
import 'package:graduation_project/feature/drink_water/data/models/water_record_model.dart';
import 'package:graduation_project/feature/drink_water/data/repos/water_repo.dart';
import 'package:meta/meta.dart';

part 'water_record_state.dart';

class WaterRecordCubit extends Cubit<WaterRecordState> {
  WaterRecordCubit(this.waterRepo) : super(WaterRecordInitial());
  final WaterRepo waterRepo;

  void addRecord(int amount) async {
    final result = waterRepo.addWaterRecord(amount);
    result.fold(
      (l) => null,
      (r) {
        featchWaterRecords();
      },
    );
  }

  featchWaterRecords() {
    final result = waterRepo.featchWaterRecords();
    result.fold(
      (l) => null,
      (records) {
        emit(WaterRecordSuccess(waterRecordModel: records));
      },
    );
  }
}
