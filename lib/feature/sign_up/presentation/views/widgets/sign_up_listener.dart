import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/functions/custom_snack_bar.dart';
import 'package:graduation_project/core/functions/error_dialog.dart';
import 'package:graduation_project/core/functions/upload_data_dialog.dart';
import 'package:graduation_project/core/helpers/cashe_helper.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/feature/sign_up/presentation/manger/cubit/signup_cubit.dart';

class SignUpListener extends StatelessWidget {
  const SignUpListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupILoading) {
          showLoadingDialog(context, loadingMessage: 'Please wait a moment.');
        } else if (state is SignupFailure) {
          context.pop();
          showErrorDialog(context, errorMessage: state.errorMessage);
        } else if (state is SignupSuccess) {
          context.pop();

          context.pushNamedAndRemoveUntil(Routes.dataForm,
              predicate: (route) => false, arguments: 'all');
          showSuccessToast("let's complete user data");
          CasheHlper.saveData(key: 'login', value: true);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
