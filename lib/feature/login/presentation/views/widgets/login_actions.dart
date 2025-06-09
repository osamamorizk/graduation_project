import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/widgets/custom_action_button.dart';
import 'package:graduation_project/feature/login/presentation/manger/cubit/login_cubit.dart';

class LoginActions extends StatefulWidget {
  const LoginActions({
    super.key,
  });

  @override
  State<LoginActions> createState() => _LoginActionsState();
}

class _LoginActionsState extends State<LoginActions> {
  bool remember = false;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 30,
                  height: 30,
                  child: Checkbox(
                    value: remember,
                    activeColor: isDark
                        ? ColorsManger.neonPurple
                        : ColorsManger.darkBlue,
                    onChanged: (value) {
                      setState(() {
                        remember = value!;
                      });
                    },
                  ),
                ),
                Text('Remember Me',
                    style: Theme.of(context).textTheme.labelSmall),
              ],
            ),
            TextButton(
              onPressed: () => context.pushNamed(Routes.forgetPassword),
              child: Text(
                'Forgot Password?',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ],
        ),
        verticalSpace(16.h),
        CustomButton(
          onPressed: () {
            if (context.read<LoginCubit>().formKey.currentState!.validate()) {
              context.read<LoginCubit>().login(
                    userName:
                        context.read<LoginCubit>().userNameController.text,
                    password:
                        context.read<LoginCubit>().passwordController.text,
                  );
            }
          },
          text: 'Login',
        ),
      ],
    );
  }
}
