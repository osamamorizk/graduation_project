import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/feature/user_data_form/presentation/manger/cubit/user_data_cubit.dart';
import 'package:graduation_project/feature/user_data_form/presentation/views/widgets/custom_multi_selection.dart';

class HealthConcernsView extends StatefulWidget {
  const HealthConcernsView({super.key});

  @override
  State<HealthConcernsView> createState() => _HealthConcernsViewState();
}

List<String> healthConcerns = [
  "Diabetes",
  "Heart conditions",
  "Joint problems",
  "High cholesterol",
  "Other health concerns"
];

final List<String> selectedHealthConcerns = [];

class _HealthConcernsViewState extends State<HealthConcernsView> {
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
              'Do you have any medical or physical concerns we should consider?',
              style: TextStyles.font18BlackBold,
            ),
            verticalSpace(40.h),
            ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) => verticalSpace(20.h),
              itemBuilder: (context, index) {
                final restrictions = healthConcerns[index];
                final bool isRestrict =
                    selectedHealthConcerns.contains(restrictions);
                return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isRestrict) {
                          selectedHealthConcerns.remove(restrictions);
                        } else {
                          selectedHealthConcerns.add(restrictions);
                        }
                        if (index == healthConcerns.length - 1) {
                          selectedHealthConcerns.add(
                              BlocProvider.of<UserDataCubit>(context)
                                  .preferedExerciseController
                                  .text);
                        }
                        BlocProvider.of<UserDataCubit>(context).helthConcerns =
                            selectedHealthConcerns;
                      });
                    },
                    child: CustomMultiSelectionItem(
                      isSelected: isRestrict,
                      goal: healthConcerns[index],
                    ));
              },
              itemCount: healthConcerns.length,
            ),
            verticalSpace(30.h),
            Text(
              'If Other, please specify',
              style: TextStyles.font14BlackBold,
            ),
            TextField(
              decoration: InputDecoration(
                  hintStyle: TextStyles.font14BlueRegular,
                  hintText: selectedHealthConcerns
                          .contains(healthConcerns[healthConcerns.length - 1])
                      ? 'Required Field'
                      : null),
              controller: BlocProvider.of<UserDataCubit>(context)
                  .otherHelthConcernsController,
              enabled: selectedHealthConcerns
                  .contains(healthConcerns[healthConcerns.length - 1]),
            ),
          ],
        ),
      ),
    );
  }
}
