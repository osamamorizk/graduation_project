import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:graduation_project/feature/scan_food/data/models/new_food_model/item.dart';
import 'package:graduation_project/feature/scan_food/data/repos/scan_food_repo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'scan_food_state.dart';

class ScanFoodCubit extends Cubit<ScanFoodState> {
  ScanFoodCubit(this.scanFoodRepo) : super(ScanFoodInitial());

  final ScanFoodRepo scanFoodRepo;

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (File(image!.path).existsSync()) {
        emit(ScanImagePicked(image.path));
      } else {
        emit(ScanCancelled());
      }
    } catch (e) {
      emit(ScanError("Failed to pick image"));
    }
  }

  Future<void> scanFood({required String imagePath}) async {
    emit(ScanFoodLoading());
    var result = await scanFoodRepo.postScanFood(
      imagePath: imagePath,
    );

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
