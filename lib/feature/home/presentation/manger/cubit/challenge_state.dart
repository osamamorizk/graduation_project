part of 'challenge_cubit.dart';

@immutable
sealed class ChallengeState {}

final class ChallengeInitial extends ChallengeState {}

final class ChallengeLoading extends ChallengeState {}

final class ChallengeSuccess extends ChallengeState {
  final ChallengeModel challengeModel;
  ChallengeSuccess(this.challengeModel);
}

final class ChallengeFailure extends ChallengeState {
  final String errorMessage;
  ChallengeFailure(this.errorMessage);
}

final class LevelLoading extends ChallengeState {}

final class LevelSuccess extends ChallengeState {
  final LevelModel levelModel;
  LevelSuccess(this.levelModel);
}

final class LevelFailure extends ChallengeState {
  final String errorMessage;
  LevelFailure(this.errorMessage);
}
