import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/helpers/cashe_helper.dart';
import 'package:graduation_project/core/helpers/end_points_const.dart';
import 'package:graduation_project/core/helpers/errors.dart';
import 'package:graduation_project/core/networking/api_service.dart';
import 'package:graduation_project/feature/login/data/repos/login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  final ApiService apiService;

  LoginRepoImpl(this.apiService);

  @override
  Future<Either<Failure, String>> login(
      {required String userName, required String password}) async {
    try {
      var result = await apiService.post(
        endPoints: loginEndPoint,
        data: {'username': userName, 'password': password},
      );
      CasheHlper.saveData(key: 'token', value: result['token']);
      return right('Login successful');
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
