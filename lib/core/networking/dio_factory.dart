import 'package:dio/dio.dart';

class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioHeaders();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioHeaders() async {
    dio?.options.baseUrl = 'https://vcare.integration25.com/api/';
    dio?.options.headers = {
      'Accept': 'application/json',
      'Authorization':
          'Bearer ${'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3ZjYXJlLmludGVncmF0aW9uMjUuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNzM4MzI3Mzk2LCJleHAiOjE3Mzg0MTM3OTYsIm5iZiI6MTczODMyNzM5NiwianRpIjoiRm9GOWxtNkN6UERFYmJBNiIsInN1YiI6IjIyNTYiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.vlLhULHvgXFXlY43rSBLxAkICq7xNWHNHbXrSI0AG6U'}',
    };
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    dio?.options.headers['Authorization'] = 'Bearer $token';
  }
}
