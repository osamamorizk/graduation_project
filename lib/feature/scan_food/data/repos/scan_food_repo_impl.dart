import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/helpers/errors.dart';
import 'package:graduation_project/core/networking/api_service.dart';
import 'package:graduation_project/feature/scan_food/data/models/scan_food_model.dart';
import 'package:graduation_project/feature/scan_food/data/repos/scan_food_repo.dart';
import 'package:http_parser/http_parser.dart';

class ScanFoodRepoImpl implements ScanFoodRepo {
  final ApiService apiService;

  ScanFoodRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<ScanFoodModel>>> postScanFood(
      {required String imagePath, required int id}) async {
    try {
      String fileName = imagePath.split('/').last;

      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(
          imagePath,
          filename: fileName,
          contentType: MediaType('image', 'jpg'),
        ),
      });
      List<ScanFoodModel> scanedFoodList = [];
      var result = await apiService.post(
          endPoints: 'FoodDetection/scan?userId=1',
          data: formData,
          options: Options(
            headers: {
              "Content-Type": "multipart/form-data",
            },
          ));
      for (var element in result['nutritional_info']) {
        scanedFoodList.add(ScanFoodModel.fromJson(element));
      }

      return right(scanedFoodList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
