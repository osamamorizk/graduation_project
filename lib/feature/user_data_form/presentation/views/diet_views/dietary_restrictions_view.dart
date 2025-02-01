import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/feature/user_data_form/presentation/manger/cubit/user_data_cubit.dart';
import 'package:graduation_project/feature/user_data_form/presentation/views/widgets/custom_multi_selection.dart';
import 'package:graduation_project/feature/user_data_form/presentation/views/widgets/user_form_text_field.dart';

class DietaryRestrictionsView extends StatefulWidget {
  const DietaryRestrictionsView({super.key});

  @override
  State<DietaryRestrictionsView> createState() =>
      _DietaryRestrictionsViewState();
}

List<String> restrictionsOptions = [
  "None",
  "Vegetarian",
  "Gluten-Free",
  "Dairy-Free",
  "Other health concerns"
];
List<String> selectedDietaryRestrictions = [];

class _DietaryRestrictionsViewState extends State<DietaryRestrictionsView> {
  @override
  Widget build(BuildContext context) {
    final userDataCubit = BlocProvider.of<UserDataCubit>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(35.h),
            Text(
              'Do you follow any specific diet or have food allergies?',
              style: TextStyles.font18BlackBold,
            ),
            verticalSpace(40.h),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) => verticalSpace(24.h),
              itemBuilder: (context, index) {
                final restrictions = restrictionsOptions[index];
                final bool isRestrict =
                    selectedDietaryRestrictions.contains(restrictions);
                return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isRestrict) {
                          selectedDietaryRestrictions.remove(restrictions);
                        } else {
                          selectedDietaryRestrictions.add(restrictions);
                        }

                        if (index == restrictionsOptions.length - 1) {
                          selectedDietaryRestrictions.add(
                              userDataCubit.preferedExerciseController.text);
                        }
                        userDataCubit.dietaryRestrictions =
                            selectedDietaryRestrictions.join(' , ');
                      });
                    },
                    child: CustomMultiSelectionItem(
                      isSelected: isRestrict,
                      goal: restrictionsOptions[index],
                    ));
              },
              itemCount: restrictionsOptions.length,
            ),
            verticalSpace(30.h),
            Text(
              'If Other, please specify',
              style: TextStyles.font14BlackBold,
            ),
            UserFormTextField(
              controller: userDataCubit.otherDietaryRestrictionsController,
              enabled: selectedDietaryRestrictions.contains(
                  restrictionsOptions[restrictionsOptions.length - 1]),
            ),
            verticalSpace(40.h),
          ],
        ),
      ),
    );
  }
}
