import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/helpers/end_points_const.dart';
import 'package:graduation_project/core/helpers/errors.dart';
import 'package:graduation_project/core/networking/api_service.dart';
import 'package:graduation_project/feature/user_data_form/data/models/user_data_form_model.dart';
import 'package:graduation_project/feature/user_data_form/data/repos/user_data_form_repo.dart';

class UserDataRepoImpl implements UserDataFormRepo {
  final ApiService apiService;

  UserDataRepoImpl(this.apiService);
  @override
  Future<Either<Failure, UserDataFormModel>> postUserData(
      {required UserDataFormModel userDataFormModel}) async {
    try {
      final body = userDataFormModel.uerFormToJson();
      log(body.toString());
      final result =
          await apiService.post(endPoints: postDataEndPoint, data: body);
      final userDataModel = UserDataFormModel.fromJson(result['user']);
      return right(userDataModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, UserDataFormModel>> putDiet(
      {required UserDataFormModel userDataFormModel}) async {
    try {
      final body = userDataFormModel.uerFormToJson();
      final result =
          await apiService.put(endPoints: postDataEndPoint, data: body);
      final userDataModel = UserDataFormModel.fromJson(result['user']);
      return right(userDataModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, UserDataFormModel>> putWorkout(
      {required UserDataFormModel userDataFormModel}) async {
    try {
      final body = userDataFormModel.uerFormToJson();
      final result = await apiService.put(endPoints: 'endPoints', data: body);
      final userDataModel = UserDataFormModel.fromJson(result['user']);
      return right(userDataModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
