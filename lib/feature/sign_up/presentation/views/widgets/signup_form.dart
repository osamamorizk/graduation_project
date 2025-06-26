import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/helpers/app_regex.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/widgets/custom_text_form_field.dart';
import 'package:graduation_project/feature/sign_up/presentation/manger/cubit/signup_cubit.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isSecure = true;

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController passwordConfirController;
  late TextEditingController phoneController;
  late TextEditingController userNameController;
  @override
  void initState() {
    emailController = context.read<SignupCubit>().emailController;
    passwordController = context.read<SignupCubit>().passwordController;
    passwordConfirController =
        context.read<SignupCubit>().passwordConfirmController;
    userNameController = context.read<SignupCubit>().userNameController;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          CustomTextFormField(
            onFieldSubmitted: (value) {
              FocusScope.of(context).nextFocus();
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter username';
              }
            },
            controller: userNameController,
            keyboardType: TextInputType.visiblePassword,
            hintText: 'Username',
          ),
          verticalSpace(20),
          CustomTextFormField(
            onFieldSubmitted: (value) {
              FocusScope.of(context).nextFocus();
            },
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            hintText: 'Email',
          ),
          verticalSpace(20),
          CustomTextFormField(
            onFieldSubmitted: (value) {
              FocusScope.of(context).nextFocus();
            },
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
          verticalSpace(20),
          CustomTextFormField(
            onFieldSubmitted: (value) {
              FocusScope.of(context).unfocus();
            },
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  passwordConfirController.text != passwordController.text) {
                return 'Password not match';
              }
            },
            controller: passwordConfirController,
            keyboardType: TextInputType.visiblePassword,
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isSecure = !isSecure;
                  });
                },
                icon: Icon(isSecure ? Icons.visibility_off : Icons.visibility)),
            obscureText: isSecure,
            hintText: 'Confirm Password',
          ),
          verticalSpace(8),
          Text(
              'Note: The password must be at least 8 characters long and include a combination of uppercase letters, lowercase letters, and special characters.',
              style: Theme.of(context).textTheme.labelSmall),
        ],
      ),
    );
  }
}
