import 'package:dio/dio.dart';
import 'package:graduation_project/core/helpers/cache_helper.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio) {
    dio.options = BaseOptions(
      baseUrl: 'http://54.198.235.195:8080/api/',
      // connectTimeout: const Duration(seconds: 30),
      // receiveTimeout: const Duration(seconds: 30),
      // sendTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    dio.interceptors.addAll([
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await CacheHelper.getSecuredData(key: 'token');
          options.headers['Authorization'] = 'Bearer $token ';
          return handler.next(options);
        },
        onError: (error, handler) async {
          // If token expired
          if (error.response?.statusCode == 401) {
            final refreshToken =
                await CacheHelper.getSecuredData(key: 'refreshToken');
            final token = await CacheHelper.getSecuredData(key: 'token');

            if (refreshToken != null) {
              try {
                // Call refresh token API
                final response = await dio.post('Auth/refresh-token', data: {
                  'token': token,
                  'refreshToken': refreshToken,
                });

                final newAccessToken = response.data['token'];
                final newRefreshToken = response.data['refreshToken'];

                // Save new tokens
                await CacheHelper.saveSecuredData(
                    key: 'token', value: newAccessToken);
                await CacheHelper.saveSecuredData(
                    key: 'refreshToken', value: newRefreshToken);

                // // Retry original request with new token
                // final originalRequest = error.requestOptions;
                // originalRequest.headers['Authorization'] =
                //     'Bearer $newAccessToken';

                // final clonedResponse = await dio.request(
                //   originalRequest.path,
                //   options: Options(
                //     method: originalRequest.method,
                //     headers: originalRequest.headers,
                //   ),
                //   data: originalRequest.data,
                //   queryParameters: originalRequest.queryParameters,
                // );

                // return handler.resolve(clonedResponse);
              } catch (e) {
                return handler.reject(error);
              }
            }
          }

          return handler.next(error);
        },
      ),
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    ]);
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
