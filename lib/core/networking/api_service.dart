import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio) {
    dio.options = BaseOptions(
      baseUrl: 'https://nutrixia.us.kg/api/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 15),
      // headers: {
      //   'Content-Type': 'application/json',
      //   'Accept': 'application/json',
      // },
    );
    dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }

  Future<dynamic> get(
      {Map<String, dynamic>? queryParams, required String endPoints}) async {
    Response response = await dio.get(
      endPoints,
    );
    return response.data;
  }

  Future<dynamic> post(
      {required String endPoints,
      required dynamic data,
      Options? options}) async {
    Response response = await dio.post(endPoints, data: data, options: options);
    return response.data;
  }

  Future<Map<String, dynamic>> put(
      {required String endPoints, required Map data}) async {
    Response response = await dio.put(endPoints, data: data);
    return response.data;
  }
}
