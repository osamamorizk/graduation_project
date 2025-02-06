import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/feature/user_data_form/presentation/manger/cubit/user_data_cubit.dart';
import 'package:graduation_project/feature/user_data_form/presentation/views/widgets/custom_single_selected_item.dart';

class WorkoutDayNumberView extends StatefulWidget {
  const WorkoutDayNumberView({super.key});

  @override
  State<WorkoutDayNumberView> createState() => _WorkoutDayNumberViewState();
}

final List<String> daysOptions = ["2 Days", "3 Days", "4 Days", "5 Days"];
final List<int> daysNumbers = [2, 3, 4, 5];

class _WorkoutDayNumberViewState extends State<WorkoutDayNumberView> {
  int? selectedIndex;
  @override
  void initState() {
    selectedIndex = BlocProvider.of<UserDataCubit>(context).workoutDays;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          verticalSpace(35.h),
          Text(
            'How many days a week can you realistically workout?',
            style: TextStyles.font18BlackBold,
          ),
          verticalSpace(40.h),
          ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) => verticalSpace(24.h),
            itemCount: daysOptions.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                    BlocProvider.of<UserDataCubit>(context).workoutDays =
                        daysNumbers[index];
                  });
                },
                child: CustomSingleSelectedItem(
                  textAlign: TextAlign.center,
                  title: daysOptions[index],
                  isSelected: selectedIndex == index,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
