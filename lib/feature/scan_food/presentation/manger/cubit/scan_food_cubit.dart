import 'package:bloc/bloc.dart';
import 'package:graduation_project/feature/scan_food/data/models/scan_food_model.dart';
import 'package:graduation_project/feature/scan_food/data/repos/scan_food_repo.dart';
import 'package:meta/meta.dart';

part 'scan_food_state.dart';

class ScanFoodCubit extends Cubit<ScanFoodState> {
  ScanFoodCubit(this.scanFoodRepo) : super(ScanFoodInitial());

  final ScanFoodRepo scanFoodRepo;

  Future<void> scanFood({required String imagePath}) async {
    emit(ScanFoodLoading());
    var result = await scanFoodRepo.postScanFood(imagePath: imagePath);

    result.fold(
      (failure) {
        emit(ScanFoodFailure(errorMessage: failure.errorMessage));
      },
      (scanResponse) {
        emit(ScanFoodSuccess(scanFoodList: scanResponse));
      },
    );
  }
}
