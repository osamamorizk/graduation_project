import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/functions/custom_snack_bar.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/widgets/custom_action_button.dart';
import 'package:graduation_project/feature/user_data_form/data/constants.dart';
import 'package:graduation_project/feature/user_data_form/presentation/manger/cubit/user_data_cubit.dart';
import 'package:graduation_project/feature/user_data_form/presentation/views/widgets/form_bar.dart';
import 'package:graduation_project/core/helpers/spacing.dart';

class UserDataForm extends StatefulWidget {
  const UserDataForm({super.key, required this.category});
  final String category;
  @override
  State<UserDataForm> createState() => _UserDataFormState();
}

class _UserDataFormState extends State<UserDataForm> {
  int currentIndex = 0;
  late List<Widget> selectedScreens;

  @override
  void initState() {
    super.initState();
    selectedScreens = getScreensBasedOnCategory(widget.category);
  }

  List<Widget> getScreensBasedOnCategory(String category) {
    if (category == 'diet') {
      return dietScreens;
    } else if (category == 'workout') {
      return workoutScreens;
    } else {
      return formScreens;
    }
  }

  void nextScreen() {
    if (currentIndex < formScreens.length - 1) {
      setState(() {
        currentIndex++;
      });
    }
  }

  void previousScreen() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Scaffold(
        appBar: customDataFormBar(
          IconButton(
            onPressed: () {
              currentIndex == 0 ? context.pop() : previousScreen();
            },
            icon: Icon(
              size: 22,
              Icons.arrow_back,
              color: ColorsManger.darkBlue,
            ),
          ),
          (currentIndex + 1) / selectedScreens.length,
        ),
        body: Column(
          children: [
            Expanded(
              child: selectedScreens[currentIndex],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomButton(
                text: currentIndex != selectedScreens.length - 1
                    ? 'Continue'
                    : 'submit',
                onPressed: () {
                  final userDataCubit = context.read<UserDataCubit>();

                  bool isValid = false;
                  if (widget.category == 'diet') {
                    isValid = userDataCubit.validateDietData();
                  } else if (widget.category == 'workout') {
                    isValid = userDataCubit.validateWorkoutData();
                  } else {
                    isValid = userDataCubit.validateAllData();
                  }

                  if (currentIndex == selectedScreens.length - 1) {
                    if (isValid) {
                      context.pushNamed(Routes.bottomBar);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        cuatomSnackBar(
                            text: 'Please complete all required fields.'),
                      );
                    }
                  } else {
                    nextScreen();
                  }
                },
              ),
            ),
            verticalSpace(30.h),
          ],
        ),
      ),
    );
  }
}
