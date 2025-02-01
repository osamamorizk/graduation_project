import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/text_styles.dart';

import 'package:graduation_project/feature/user_data_form/presentation/manger/cubit/user_data_cubit.dart';
import 'package:graduation_project/feature/user_data_form/presentation/views/widgets/custom_single_selected_item.dart';

class ActivityGoalView extends StatefulWidget {
  const ActivityGoalView({super.key});

  @override
  State<ActivityGoalView> createState() => _ActivityGoalViewState();
}

List<String> titles = [
  "Sedentary",
  "Slightly Active",
  "Moderately Active",
  "Very Active",
];
List<String> descriptions = [
  "I do almost no exercise",
  "I exercise up to 2 hours in a week",
  "I exercise up to 4 hours in a week",
  "I exercise for 4+ hours in a week",
];
List<String> imagePaths = [
  Assets.icons0bar,
  Assets.icons1bar,
  Assets.icons2bar,
  Assets.icons3bar,
];

int? selectedIndex;

class _ActivityGoalViewState extends State<ActivityGoalView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(35.h),
          Text(
            'What is your activity level?',
            style: TextStyles.font18BlackBold,
          ),
          verticalSpace(40.h),
          Expanded(
            child: ListView.separated(
                separatorBuilder: (context, index) => verticalSpace(32.h),
                shrinkWrap: true,
                itemCount: titles.length,
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                          BlocProvider.of<UserDataCubit>(context)
                              .activityLevel = titles[index];
                        });
                      },
                      child: CustomSingleSelectedItem(
                        title: titles[index],
                        image: Image.asset(imagePaths[index]),
                        subtitle: Text(
                          descriptions[index],
                          style: TextStyles.font14greyNormal
                              .copyWith(fontSize: 12),
                        ),
                        isSelected: selectedIndex == index,
                      ),
                    )),
          ),
        ],
      ),
    );
  }
}
