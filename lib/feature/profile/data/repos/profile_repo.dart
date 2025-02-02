import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/helpers/errors.dart';
import 'package:graduation_project/feature/profile/data/models/user_model.dart';

abstract class ProfileRepo {
  Future<Either<Failure, UserModel>> getProfileData({required String id});
}
