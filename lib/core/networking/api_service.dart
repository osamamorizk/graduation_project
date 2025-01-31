import 'package:dio/dio.dart';
import 'package:graduation_project/core/networking/dio_factory.dart';

class ApiService {
  final Dio dio = DioFactory.getDio();

  ApiService() {
    dio.options = BaseOptions(headers: {
      "Authorization":
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3ZjYXJlLmludGVncmF0aW9uMjUuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNzM4MzI3Mzk2LCJleHAiOjE3Mzg0MTM3OTYsIm5iZiI6MTczODMyNzM5NiwianRpIjoiRm9GOWxtNkN6UERFYmJBNiIsInN1YiI6IjIyNTYiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.vlLhULHvgXFXlY43rSBLxAkICq7xNWHNHbXrSI0AG6U}",
    });
  }

  Future<Map<String, dynamic>> get({required String endPoints}) async {
    Response response = await dio.get(endPoints);
    return response.data;
  }

  Future<Map<String, dynamic>> post(
      {required String endPoints, required Map body}) async {
    Response response = await dio.post(endPoints, data: body);
    return response.data;
  }
}
