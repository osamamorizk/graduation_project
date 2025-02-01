import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/text_styles.dart';

import 'package:graduation_project/feature/user_data_form/presentation/manger/cubit/user_data_cubit.dart';
import 'package:graduation_project/feature/user_data_form/presentation/views/widgets/custom_single_selected_item.dart';

class FitnessLevelView extends StatefulWidget {
  const FitnessLevelView({super.key});

  @override
  State<FitnessLevelView> createState() => _FitnessLevelViewState();
}

List<String> titles = [
  "Beginner",
  "Intermediate",
  "Advanced",
];

List<String> descriptions = [
  "I have been working out for 0-1 month",
  "I have been working out for 1-24 months",
  "I have been working out for 24+ months",
];

int? selectedIndex;

class _FitnessLevelViewState extends State<FitnessLevelView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(35.h),
          Text(
            'What is your Fitness level?',
            style: TextStyles.font18BlackBold,
          ),
          verticalSpace(40.h),
          ListView.separated(
              separatorBuilder: (context, index) => verticalSpace(32.h),
              shrinkWrap: true,
              itemCount: titles.length,
              itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        BlocProvider.of<UserDataCubit>(context).fitnessLevel =
                            titles[index];
                      });
                    },
                    child: CustomSingleSelectedItem(
                      title: titles[index],
                      subtitle: Text(
                        descriptions[index],
                        style:
                            TextStyles.font14greyNormal.copyWith(fontSize: 12),
                      ),
                      isSelected: selectedIndex == index,
                    ),
                  )),
        ],
      ),
    );
  }
}
