import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/functions/custom_snack_bar.dart';
import 'package:graduation_project/core/helpers/cashe_helper.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/widgets/custom_action_button.dart';
import 'package:graduation_project/feature/user_data_form/data/constants.dart';
import 'package:graduation_project/feature/user_data_form/presentation/manger/cubit/user_data_cubit.dart';
import 'package:graduation_project/feature/user_data_form/presentation/views/widgets/form_bar.dart';
import 'package:graduation_project/core/helpers/spacing.dart';

class UserDataFormBody extends StatefulWidget {
  const UserDataFormBody({super.key, required this.category});
  final String category;
  @override
  State<UserDataFormBody> createState() => _UserDataFormBodyState();
}

class _UserDataFormBodyState extends State<UserDataFormBody> {
  int currentIndex = 0;
  late List<Widget> selectedScreens;

  @override
  void initState() {
    super.initState();
    selectedScreens = formScreens;
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
              currentIndex == 0
                  ? (widget.category == 'all')
                      ? null
                      : context.pop()
                  : previousScreen();
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
                onPressed: () => handleFormSubmission(context),
              ),
            ),
            verticalSpace(30.h),
          ],
        ),
      ),
    );
  }

  void handleFormSubmission(BuildContext context) {
    final userDataCubit = context.read<UserDataCubit>();
    bool isValid = userDataCubit.validateAllData();
    final data = {
      'age': userDataCubit.age.toInt(),
      'gender': userDataCubit.gender,
      'height': (userDataCubit.tall / 100).toInt(),
      'weight': userDataCubit.weight.toInt(),
      'fitnessLevel': userDataCubit.fitnessLevel,
      'weeklyWorkoutDays': userDataCubit.workoutDays,
      'workoutDuration': userDataCubit.workoutTime,
      'goal': userDataCubit.userGoals,
      'dietaryRestrictions': userDataCubit.dietaryRestrictions,
      'preferredDiet': userDataCubit.dietKind,
      'medicalConditions': userDataCubit.helthConcerns,
    };
    if (currentIndex == selectedScreens.length - 1) {
      if (isValid) {
        if (widget.category == 'workout') {
          log('workout , put');
          int userId = CasheHlper.getData(key: 'userId') ?? 4;
          userDataCubit.putWorkout(
            data: data,
            id: userId,
          );
        } else if (widget.category == 'diet') {
          log('diet , put');
          int userId = CasheHlper.getData(key: 'userId') ?? 4;

          userDataCubit.putUser(
            data: data,
            id: userId,
          );
        } else if (widget.category == 'putUser') {
          log('user , put');
          int userId = CasheHlper.getData(key: 'userId') ?? 4;

          userDataCubit.putUser(
            data: data,
            id: userId,
          );
        } else {
          log('post');
          userDataCubit.postUserData(
            data: data,
          );
        }
      } else {
        showCustomSnackBar(
            text: 'Please complete all required fields.', context);
      }
    } else {
      nextScreen();
    }
  }
}
