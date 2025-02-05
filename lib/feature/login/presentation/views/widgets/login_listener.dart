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
          showLoadingDialog(context, loadingMessage: 'Please wait a moment.');
        } else if (state is LoginFailure) {
          context.pop();
          showErrorDialog(context, errorMessage: state.errorMessage);
        } else if (state is LoginSuccess) {
          context.pop();

          showSuccessToast(state.loginDone);
          context.pushNamedAndRemoveUntil(
            Routes.bottomBar,
            predicate: (route) => false,
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
