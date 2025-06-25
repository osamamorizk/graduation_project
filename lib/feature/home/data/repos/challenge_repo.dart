import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/helpers/errors.dart';
import 'package:graduation_project/feature/home/data/models/chanllenge_model/chanllenge_model.dart';

abstract class ChallengeRepo {
  Future<Either<Failure, ChallengeModel>> getChallenges();
}
