import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/helpers/errors.dart';
import 'package:graduation_project/core/networking/api_service.dart';
import 'package:graduation_project/core/networking/end_points.dart';
import 'package:graduation_project/feature/user_data_form/data/models/user_data_form_model.dart';
import 'package:graduation_project/feature/user_data_form/data/repos/user_data_form_repo.dart';

class UserDataRepoImpl implements UserDataFormRepo {
  final ApiService apiService;

  UserDataRepoImpl(this.apiService);
  @override
  Future<Either<Failure, UserDataFormModel>> postUserData({
    required Map data,
  }) async {
    try {
      final result =
          await apiService.post(endPoints: userDataEndPoint, data: data);
      final userDataModel = UserDataFormModel.fromJson(result['userProfile']);
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
  Future<Either<Failure, UserDataFormModel>> putUser(
      {required Map<String, dynamic> data, required int id}) async {
    try {
      final result =
          await apiService.put(endPoints: userDataEndPoint, data: data);
      final userDataModel = UserDataFormModel.fromJson(result['user']);
      return right(userDataModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        log(e.toString());
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

//   @override
//   Future<Either<Failure, UserDataFormModel>> putDiet(
//       {required Map data, required int id}) async {
//     try {
//       final result = await apiService.put(
//           endPoints: 'Plan/update-diet-plan/$id', data: data);
//       final userDataModel = UserDataFormModel.fromJson(result['user']);
//       return right(userDataModel);
//     } catch (e) {
//       if (e is DioException) {
//         return left(ServerFailure.fromDioException(e));
//       } else {
//         return left(ServerFailure(
//             errorMessage: 'Oops! There was an error.\nPlease try again later'));
//       }
//     }
//   }

//   @override
//   Future<Either<Failure, UserDataFormModel>> putWorkout(
//       {required Map data, required int id}) async {
//     try {
//       final result = await apiService.put(
//           endPoints: 'Plan/update-workout-plan/$id', data: data);
//       final userDataModel = UserDataFormModel.fromJson(result['user']);
//       return right(userDataModel);
//     } catch (e) {
//       if (e is DioException) {
//         return left(ServerFailure.fromDioException(e));
//       } else {
//         return left(ServerFailure(
//             errorMessage: 'Oops! There was an error.\nPlease try again later'));
//       }
//     }
//   }
}
