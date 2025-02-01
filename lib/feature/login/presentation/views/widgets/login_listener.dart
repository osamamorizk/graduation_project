import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/functions/custom_snack_bar.dart';
import 'package:graduation_project/core/functions/error_dialog.dart';
import 'package:graduation_project/core/functions/upload_data_dialog.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/feature/login/presentation/manger/cubit/login_cubit.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          showLoadingDialog(context, loadingMessage: 'Login..');
        } else if (state is LoginFailure) {
          showErrorDialog(context, errorMessage: state.errorMessage);
        } else if (state is LoginSuccess) {
          context.pop();
          context.pushNamed(Routes.bottomBar);

          cuatomSnackBar(text: state.loginDone);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
