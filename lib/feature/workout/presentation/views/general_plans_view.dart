import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/text_styles.dart';

class WorkoutGeneralPlansView extends StatelessWidget {
  const WorkoutGeneralPlansView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Assets.imagesDepressedMan),
          verticalSpace(20),
          Text(
            'Still working on it',
            style: TextStyles.font16BlackBold,
          )
        ],
      ),
    );
  }
}




 //  Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 16),
    //   child: Column(
    //     children: [
    //       verticalSpace(8),
    //       Expanded(
    //         child: ListView.separated(
    //             itemCount: fitnessPlans.length,
    //             separatorBuilder: (context, index) => verticalSpace(16),
    //             itemBuilder: (context, index) => GestureDetector(
    //                   onTap: () {
    //                     showCommingSoonDialog(context);
    //                   },
    //                   child: GeneralPlanItem(
    //                     generalPLanModel: fitnessPlans[index],
    //                   ),
    //                 )),
    //       ),
    //     ],
    //   ),
    // );