import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/helpers/errors.dart';
import 'package:graduation_project/feature/sign_up/data/models/sign_up_data.dart';

abstract class SignupRepo {
  Future<Either<Failure, String>> signUp({required SignUpData signUpData});
}
