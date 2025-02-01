import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/feature/user_data_form/presentation/manger/cubit/user_data_cubit.dart';
import 'package:graduation_project/feature/user_data_form/presentation/views/widgets/custom_multi_selection.dart';

class GoalSelectionScreen extends StatefulWidget {
  const GoalSelectionScreen({super.key});

  @override
  GoalSelectionScreenState createState() => GoalSelectionScreenState();
}

class GoalSelectionScreenState extends State<GoalSelectionScreen> {
  final List<String> goals = [
    'Lose Weight',
    'Build Strength',
    'Gain Weight',
    'Reduce Stress',
    'Improve Health',
  ];

  List<String> selectedGoals = [];

  @override
  Widget build(BuildContext context) {
    selectedGoals = context.read<UserDataCubit>().userGoals;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(35.h),
          Text(
            'What is your goal?',
            style: TextStyles.font18BlackBold,
          ),
          verticalSpace(35.h),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => verticalSpace(24.h),
              itemCount: goals.length,
              itemBuilder: (context, index) {
                final goal = goals[index];
                final bool isSelected = selectedGoals.contains(goal);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        selectedGoals.remove(goal);
                      } else {
                        selectedGoals.add(goal);
                      }
                      BlocProvider.of<UserDataCubit>(context).userGoals =
                          selectedGoals;
                    });
                  },
                  child: CustomMultiSelectionItem(
                    isSelected: isSelected,
                    goal: goal,
                    image: getImageForGoal(goal),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Image getImageForGoal(String goal) {
    switch (goal) {
      case 'Lose Weight':
        return Image.asset(Assets.iconsLoseWeight);
      case 'Build Strength':
        return Image.asset(Assets.iconsStrenght);
      case 'Gain Weight':
        return Image.asset(Assets.iconsGainWeight);
      case 'Reduce Stress':
        return Image.asset(Assets.iconsReduceStress);
      case 'Improve Health':
        return Image.asset(Assets.iconsImproveHealth);
      default:
        return Image.asset(Assets.iconsLoseWeight);
    }
  }
}
