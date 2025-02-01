import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/helpers/errors.dart';

abstract class LoginRepo {
  Future<Either<Failure, String>> login(
      {required String userName, required String password});
}
