import 'package:dio/dio.dart';
import 'package:graduation_project/core/helpers/cache_helper.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio) {
    dio.options = BaseOptions(
      baseUrl: 'http://54.198.235.195:8080/api/',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    dio.interceptors.addAll([
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await CacheHelper.getSecuredData(key: 'token');
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
        // onError: (error, handler) async {
        //   if (error.response?.statusCode == 401) {
        //     final refreshToken =
        //         await CacheHelper.getSecuredData(key: 'refreshToken');
        //     final response = await dio.post('Auth/refresh-token', data: {
        //       'refreshToken': refreshToken,
        //       'token': await CacheHelper.getSecuredData(key: 'token'),
        //     });

        //     final newToken = response.data['token'];
        //     await CacheHelper.saveSecuredData(key: 'token', value: newToken);
        //   }
        //   return handler.next(error);
        // },
      ),
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    ]);
  }

  Future<dynamic> get({
    required String endPoints,
    Map<String, dynamic>? queryParams,
  }) async {
    final response = await dio.get(endPoints, queryParameters: queryParams);
    return response.data;
  }

  Future<dynamic> post({
    required String endPoints,
    required dynamic data,
    Options? options,
  }) async {
    final response = await dio.post(endPoints, data: data, options: options);
    return response.data;
  }

  Future<Map<String, dynamic>> put({
    required String endPoints,
    required Map data,
  }) async {
    final response = await dio.put(endPoints, data: data);
    return response.data;
  }
}
