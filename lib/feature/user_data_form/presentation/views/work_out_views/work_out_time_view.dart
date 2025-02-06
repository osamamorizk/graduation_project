import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/feature/user_data_form/presentation/manger/cubit/user_data_cubit.dart';
import 'package:graduation_project/feature/user_data_form/presentation/views/widgets/custom_single_selected_item.dart';

class WorkoutTimeView extends StatefulWidget {
  const WorkoutTimeView({super.key});

  @override
  State<WorkoutTimeView> createState() => _WorkoutTimeViewState();
}

List<String> options = [
  "Less than 30 minutes",
  "30-60 minutes",
  "More than 60 minutes"
];

class _WorkoutTimeViewState extends State<WorkoutTimeView> {
  int? selectedIndex;
  @override
  void initState() {
    String? workoutTime = BlocProvider.of<UserDataCubit>(context).workoutTime;

    selectedIndex = options.indexOf(workoutTime);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpace(35.h),
            Text(
              'How long can you spend working out?',
              style: TextStyles.font18BlackBold,
            ),
            verticalSpace(40.h),
            ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) => verticalSpace(24.h),
              itemCount: options.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      BlocProvider.of<UserDataCubit>(context).workoutTime =
                          options[index];
                    });
                  },
                  child: CustomSingleSelectedItem(
                      textAlign: TextAlign.center,
                      title: options[index],
                      isSelected: selectedIndex == index),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
