import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/helpers/errors.dart';
import 'package:graduation_project/core/networking/api_service.dart';
import 'package:graduation_project/feature/scan_food/data/models/scan_food_model.dart';
import 'package:graduation_project/feature/scan_food/data/repos/scan_food_repo.dart';

class ScanFoodRepoImpl implements ScanFoodRepo {
  final ApiService apiService;

  ScanFoodRepoImpl(this.apiService);
  @override
  Future<Either<Failure, ScanFoodModel>> postScanFood(
      {required String imagePath}) async {
    try {
      String fileName = imagePath.split('/').last;
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(imagePath, filename: fileName),
      });

      var result =
          await apiService.post(endPoints: 'endPoints', data: formData);

      return right(ScanFoodModel.fromJson(result['nutritional_info']));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
