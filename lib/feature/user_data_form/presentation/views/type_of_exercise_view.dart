import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/feature/user_data_form/presentation/manger/cubit/user_data_cubit.dart';
import 'package:graduation_project/feature/user_data_form/presentation/views/widgets/custom_multi_selection.dart';

class TypeOfExerciseView extends StatefulWidget {
  const TypeOfExerciseView({super.key});

  @override
  State<TypeOfExerciseView> createState() => _TypeOfExerciseViewState();
}

List<String> activityOptions = [
  "Strength Training",
  "Yoga or Pilates",
  "Cardio (Running, Cycling)",
  "Sports (e.g., Tennis, Swimming)",
  "Other"
];
List<String> activityIcons = [
  Assets.iconsDedliftStrength,
  Assets.iconsYoga,
  Assets.iconsCardio,
  Assets.iconsSwimming,
  Assets.iconsOthericon,
];

final List<String> typeOfPreferedExercise = [];

class _TypeOfExerciseViewState extends State<TypeOfExerciseView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(35.h),
            Text(
              'What type of exercises do you enjoy?',
              style: TextStyles.font18BlackBold,
            ),
            verticalSpace(40.h),
            ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) => verticalSpace(15.h),
              itemBuilder: (context, index) {
                final restrictions = activityOptions[index];
                final bool isRestrict =
                    typeOfPreferedExercise.contains(restrictions);
                return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isRestrict) {
                          typeOfPreferedExercise.remove(restrictions);
                          BlocProvider.of<UserDataCubit>(context)
                              .preferedExercise = typeOfPreferedExercise;
                        } else {
                          typeOfPreferedExercise.add(restrictions);
                          BlocProvider.of<UserDataCubit>(context)
                              .preferedExercise = typeOfPreferedExercise;
                        }
                        if (index == activityOptions.length - 1) {
                          typeOfPreferedExercise.add(
                              BlocProvider.of<UserDataCubit>(context)
                                  .preferedExerciseController
                                  .text);
                        }
                      });
                    },
                    child: CustomMultiSelectionItem(
                      // image: Image.asset(
                      //   activityIcons[index],
                      // ),
                      isSelected: isRestrict,
                      goal: activityOptions[index],
                    ));
              },
              itemCount: activityOptions.length,
            ),
            verticalSpace(20.h),
            Text(
              'If Other, please specify',
              style: TextStyles.font14BlackBold,
            ),
            TextFormField(
              controller: BlocProvider.of<UserDataCubit>(context)
                  .preferedExerciseController,
              enabled: typeOfPreferedExercise
                  .contains(activityOptions[activityOptions.length - 1]),
            )
          ],
        ),
      ),
    );
  }
}
