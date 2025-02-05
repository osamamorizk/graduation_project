import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/functions/custom_snack_bar.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/widgets/custom_action_button.dart';
import 'package:graduation_project/feature/user_data_form/data/constants.dart';
import 'package:graduation_project/feature/user_data_form/data/models/user_data_form_model.dart';
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

    if (currentIndex == selectedScreens.length - 1) {
      if (isValid) {
        final userData = UserDataFormModel(
          id: 0,
          gender: userDataCubit.gender,
          age: userDataCubit.age.toInt(),
          height: (userDataCubit.tall / 100).toInt(),
          weight: userDataCubit.weight.toInt(),
          fitnessLevel: userDataCubit.fitnessLevel,
          weeklyWorkoutDays: userDataCubit.workoutDays,
          workoutDuration: userDataCubit.workoutTime,
          goal: userDataCubit.userGoals,
          dietaryRestrictions: userDataCubit.dietaryRestrictions,
          preferredDiet: userDataCubit.dietKind,
          medicalConditions: 'userDataCubit.helthConcerns',
        );
        userDataCubit.postUserData(userDataFormModel: userData);
        // if (widget.category == 'workout') {
        //   userDataCubit.putWorkout(userDataFormModel: userData);
        // } else if (widget.category == 'diet') {
        //   log('diet , put');
        //   //pu diet
        //   userDataCubit.putDiet(userDataFormModel: userData);
        // } else {
        //   //post user
        //   userDataCubit.postUserData(userDataFormModel: userData);
        // }
      } else {
        showCustomSnackBar(
            text: 'Please complete all required fields.', context);
      }
    } else {
      nextScreen();
    }
  }
}
