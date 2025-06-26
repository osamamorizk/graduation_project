import 'package:bloc/bloc.dart';
import 'package:graduation_project/feature/profile/data/models/user_model.dart';
import 'package:graduation_project/feature/profile/data/repos/profile_repo.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(ProfileInitial());

  final ProfileRepo profileRepo;

  Future<void> getProfile() async {
    emit(ProfileLoading());
    var result = await profileRepo.getProfileData();
    result.fold(
      (failure) {
        emit(ProfileFailure(errorMessage: failure.errorMessage));
      },
      (user) {
        emit(ProfileSuccess(userModel: user));
      },
    );
  }
}
