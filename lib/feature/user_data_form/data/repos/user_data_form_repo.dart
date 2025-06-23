import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/helpers/errors.dart';
import 'package:graduation_project/feature/user_data_form/data/models/user_data_form_model.dart';

abstract class UserDataFormRepo {
  Future<Either<Failure, UserDataFormModel>> postUserData({
    required Map data,
  });
  Future<Either<Failure, UserDataFormModel>> putUser({
    required Map<String, dynamic> data,
  });
//   Future<Either<Failure, UserDataFormModel>> putDiet(
//       {required Map data, required int id});

//   Future<Either<Failure, UserDataFormModel>> putWorkout(
//       {required Map data, required int id});
}
