import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/feature/login/data/repos/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  final LoginRepo loginRepo;
  var formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login(
      {required String userName, required String password}) async {
    emit(LoginLoading());
    var result = await loginRepo.login(password: password, userName: userName);
    result.fold(
      (fialure) {
        emit(LoginFailure(errorMessage: fialure.errorMessage));
      },
      (success) async {
        emit(LoginSuccess(loginDone: success));
      },
    );
  }
}
