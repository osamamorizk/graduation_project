import 'package:bloc/bloc.dart';
import 'package:graduation_project/feature/scan_food/data/models/new_food_model/item.dart';
import 'package:graduation_project/feature/scan_food/data/repos/scan_food_repo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';

part 'scan_food_state.dart';

class ScanFoodCubit extends Cubit<ScanFoodState> {
  ScanFoodCubit(this.scanFoodRepo) : super(ScanFoodInitial());

  final ScanFoodRepo scanFoodRepo;
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImageFromGallery() async {
    if (await requestGalleryPermission()) {
      final image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        emit(ScanImagePicked(image.path));
      } else {
        emit(ScanCancelled());
      }
    } else {
      emit(ScanError("Gallery permission denied"));
    }
  }

  Future<void> scanFood({required String imagePath}) async {
    emit(ScanFoodLoading());
    final result = await scanFoodRepo.postScanFood(imagePath: imagePath);

    result.fold(
      (failure) => emit(ScanFoodFailure(errorMessage: failure.errorMessage)),
      (List<Item> scanResponse) =>
          emit(ScanFoodSuccess(scanFoodList: scanResponse)),
    );
  }
}

Future<bool> requestGalleryPermission() async {
  final status = await Permission.photos.request();
  return status.isGranted;
}
