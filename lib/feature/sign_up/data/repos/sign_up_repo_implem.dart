import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/helpers/cache_helper.dart';
import 'package:graduation_project/core/helpers/errors.dart';
import 'package:graduation_project/core/networking/api_service.dart';
import 'package:graduation_project/core/networking/end_points.dart';
import 'package:graduation_project/feature/sign_up/data/models/sign_up_data.dart';
import 'package:graduation_project/feature/sign_up/data/repos/signup_repo.dart';

class SignUpRepoImplem implements SignupRepo {
  final ApiService apiService;

  SignUpRepoImplem(this.apiService);
  @override
  Future<Either<Failure, String>> signUp(
      {required SignUpData signUpData}) async {
    try {
      var result = await apiService.post(
        endPoints: signUpEndPoints,
        data: {
          'username': signUpData.username,
          'email': signUpData.email,
          'password': signUpData.password,
        },
      );
      await CacheHelper.saveSecuredData(
        key: 'token',
        value: result['token'],
      );
      await CacheHelper.saveSecuredData(
        key: 'refreshToken',
        value: result['refreshToken'],
      );
      return right('Sign up successful');
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: 'Oops, something went wrong'));
      }
    }
  }
}
