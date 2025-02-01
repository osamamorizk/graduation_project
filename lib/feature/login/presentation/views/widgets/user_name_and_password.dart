import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/helpers/app_regex.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/widgets/custom_text_form_field.dart';
import 'package:graduation_project/feature/login/presentation/manger/cubit/login_cubit.dart';

class UserNameAndPassword extends StatefulWidget {
  const UserNameAndPassword({super.key});

  @override
  State<UserNameAndPassword> createState() => _UserNameAndPasswordState();
}

class _UserNameAndPasswordState extends State<UserNameAndPassword> {
  bool isSecure = true;

  late TextEditingController userNameController;
  late TextEditingController passwordController;
  @override
  void initState() {
    userNameController = context.read<LoginCubit>().userNameController;
    passwordController = context.read<LoginCubit>().passwordController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          CustomTextFormField(
            validator: (value) {
              if (value == null) {
                return 'Please enter a valid user name';
              }
            },
            controller: userNameController,
            keyboardType: TextInputType.text,
            hintText: 'User Name',
          ),
          verticalSpace(20),
          CustomTextFormField(
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPasswordValid(value)) {
                return 'Please enter a valid password';
              }
            },
            controller: passwordController,
            keyboardType: TextInputType.visiblePassword,
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isSecure = !isSecure;
                  });
                },
                icon: Icon(isSecure ? Icons.visibility_off : Icons.visibility)),
            obscureText: isSecure,
            hintText: 'Password',
          ),
          verticalSpace(8),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    userNameController.dispose();
    super.dispose();
  }
}
