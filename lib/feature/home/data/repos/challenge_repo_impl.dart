import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/helpers/errors.dart';
import 'package:graduation_project/core/networking/api_service.dart';
import 'package:graduation_project/feature/home/data/models/chanllenge_model/chanllenge_model.dart';
import 'package:graduation_project/feature/home/data/models/level_model/level_model.dart';
import 'package:graduation_project/feature/home/data/repos/challenge_repo.dart';

class ChallengeRepoImpl implements ChallengeRepo {
  final ApiService apiService;

  ChallengeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, ChallengeModel>> getChallenges() async {
    try {
      var result = await apiService.get(endPoints: 'Challenge');
      return right(ChallengeModel.fromJson(result));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(Failure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, LevelModel>> getLevelDetails({required int id}) async {
    try {
      var result = await apiService.get(endPoints: 'Challenge/level/$id');
      return right(LevelModel.fromJson(result));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(Failure(errorMessage: e.toString()));
      }
    }
  }
}
