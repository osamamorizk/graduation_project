import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/feature/user_data_form/presentation/manger/cubit/user_data_cubit.dart';
import 'package:graduation_project/feature/user_data_form/presentation/views/widgets/custom_single_selected_item.dart';

class GoalSelectionScreen extends StatefulWidget {
  const GoalSelectionScreen({super.key});

  @override
  GoalSelectionScreenState createState() => GoalSelectionScreenState();
}

class GoalSelectionScreenState extends State<GoalSelectionScreen> {
  final List<String> goals = [
    'Build Strength',
    'Lose Weight',

    // 'Gain Weight',
    'Reduce Stress',
    'Improve Health',
  ];

  int? selectedIndex;
  @override
  void initState() {
    selectedIndex = BlocProvider.of<UserDataCubit>(context).userGoals;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      BlocProvider.of<UserDataCubit>(context).userGoals = index;
                    });
                  },
                  child: CustomSingleSelectedItem(
                    isSelected: selectedIndex == index,
                    image: getImageForGoal(goal, context),
                    title: goals[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Image getImageForGoal(String goal, BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    switch (goal) {
      case 'Lose Weight':
        return Image.asset(
          Assets.iconsLoseWeight,
        );
      case 'Build Strength':
        return Image.asset(
          Assets.iconsStrenght,
          color: isDark ? Colors.white : Colors.black,
        );
      // case 'Gain Weight':
      //   return Image.asset(Assets.iconsGainWeight);
      case 'Reduce Stress':
        return Image.asset(
          Assets.iconsReduceStress,
          color: isDark ? Colors.white : Colors.black,
        );
      case 'Improve Health':
        return Image.asset(
          Assets.iconsImproveHealth,
          color: isDark ? Colors.white : Colors.black,
        );
      default:
        return Image.asset(Assets.iconsLoseWeight);
    }
  }
}
