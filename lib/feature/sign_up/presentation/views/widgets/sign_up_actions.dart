import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/helpers/cashe_helper.dart';

import 'package:graduation_project/core/widgets/custom_action_button.dart';
import 'package:graduation_project/feature/sign_up/data/models/sign_up_data.dart';
import 'package:graduation_project/feature/sign_up/presentation/manger/cubit/signup_cubit.dart';

class SignUpActions extends StatelessWidget {
  const SignUpActions({super.key});

  @override
  Widget build(BuildContext context) {
    final signupCubit = context.read<SignupCubit>();
    return Column(
      children: [
        CustomButton(
          onPressed: () {
            if (signupCubit.formKey.currentState!.validate()) {
              CacheHelper.saveData(
                  key: 'name', value: signupCubit.userNameController.text);
              context.read<SignupCubit>().signUp(
                    signUpData: SignUpData(
                      username: signupCubit.userNameController.text,
                      email: signupCubit.emailController.text,
                      password: signupCubit.passwordController.text,
                    ),
                  );
            }
          },
          text: 'Create Account',
        ),
      ],
    );
  }
}
