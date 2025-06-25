import 'package:bloc/bloc.dart';
import 'package:graduation_project/feature/home/data/models/chanllenge_model/chanllenge_model.dart';
import 'package:graduation_project/feature/home/data/repos/challenge_repo.dart';
import 'package:meta/meta.dart';

part 'challenge_state.dart';

class ChallengeCubit extends Cubit<ChallengeState> {
  ChallengeCubit(this.challengeRepo) : super(ChallengeInitial());

  final ChallengeRepo challengeRepo;
  Future<void> getChallenges() async {
    emit(ChallengeLoading());
    final result = await challengeRepo.getChallenges();
    result.fold(
      (failure) => emit(ChallengeFailure(failure.errorMessage)),
      (challenges) => emit(ChallengeSuccess(challenges)),
    );
  }
}
