import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/helpers/errors.dart';
import 'package:graduation_project/core/networking/api_service.dart';
import 'package:graduation_project/core/networking/end_points.dart';
import 'package:graduation_project/feature/scan_food/data/models/new_food_model/item.dart';
import 'package:graduation_project/feature/scan_food/data/repos/scan_food_repo.dart';
import 'package:http_parser/http_parser.dart';

class ScanFoodRepoImpl implements ScanFoodRepo {
  final ApiService apiService;

  ScanFoodRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<Item>>> postScanFood({
    required String imagePath,
  }) async {
    try {
      String fileName = imagePath.split('/').last;

      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(
          imagePath,
          filename: fileName,
          contentType: MediaType('image', 'jpg'),
        ),
      });
      List<Item> scanedFoodList = [];
      var result = await apiService.post(
          endPoints: scanFoodEndPoint,
          data: formData,
          options: Options(
            headers: {
              "Content-Type": "multipart/form-data",
            },
          ));
      for (var element in result['response']['food_detection']['items']) {
        scanedFoodList.add(Item.fromJson(element));
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
