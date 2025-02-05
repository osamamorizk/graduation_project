import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/helpers/errors.dart';
import 'package:graduation_project/core/networking/api_service.dart';
import 'package:graduation_project/feature/profile/data/models/user_model.dart';
import 'package:graduation_project/feature/profile/data/repos/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ApiService apiService;

  ProfileRepoImpl(this.apiService);
  @override
  Future<Either<Failure, UserModel>> getProfileData({required int id}) async {
    try {
      final result = await apiService.get(endPoints: 'User/$id');

      return right(UserModel.fromJson(result));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
