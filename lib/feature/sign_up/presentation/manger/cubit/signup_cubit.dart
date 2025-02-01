import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/feature/sign_up/data/models/sign_up_data.dart';
import 'package:graduation_project/feature/sign_up/data/repos/signup_repo.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.signupRepo) : super(SignupInitial());
  final SignupRepo signupRepo;
  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  Future<void> signUp({required SignUpData signUpData}) async {
    emit(SignupILoading());
    var result = await signupRepo.signUp(signUpData: signUpData);
    result.fold(
      (fialure) {
        emit(SignupFailure(errorMessage: fialure.errorMessage));
      },
      (success) {
        emit(SignupSuccess(signupMessage: success));
      },
    );
  }
}
