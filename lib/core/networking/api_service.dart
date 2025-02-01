import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio) {
    dio.options = BaseOptions(
      baseUrl: 'https://example.com/api',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 60),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
  }

  Future<Map<String, dynamic>> get(
      {required Map<String, dynamic>? queryParams,
      required String endPoints}) async {
    Response response = await dio.get(endPoints, queryParameters: queryParams);
    return response.data;
  }

  Future<Map<String, dynamic>> post(
      {required String endPoints, required Map body}) async {
    Response response = await dio.post(endPoints, data: body);
    return response.data;
  }

  Future<Map<String, dynamic>> put(
      {required String endPoints, required Map body}) async {
    Response response = await dio.put(endPoints, data: body);
    return response.data;
  }
}
