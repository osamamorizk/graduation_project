import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/feature/bottom_nav_bar/presentation/manger/cubit/bottom_bar_cubit.dart';
import 'package:graduation_project/feature/home/presentation/views/widgets/custom_plan_choose_button.dart';

class YourPlanBox extends StatelessWidget {
  const YourPlanBox({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showPlanDialog(context);
      },
      child: Container(
        height: 94.h,
        width: MediaQuery.sizeOf(context).width / 2.4.w,
        decoration: BoxDecoration(
          image: const DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(Assets.imagesPlanboxBackground)),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              height: 27,
              Assets.svgsYourPlan,
            ),
            verticalSpace(12),
            Text(
              'Your Plan',
              style: TextStyles.font14WhiteBold,
            )
          ],
        ),
      ),
    );
  }
}

void showPlanDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        insetAnimationCurve: Curves.elasticOut,
        insetAnimationDuration: const Duration(milliseconds: 200),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5,
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomChosePlanButton(
                text: 'Diet plan',
                icon: Icons.restaurant,
                onPressed: () {
                  context.pop();
                  BlocProvider.of<BottomBarCubit>(context)
                      .controller
                      .jumpToTab(1);
                },
              ),
              verticalSpace(24),
              CustomChosePlanButton(
                text: 'Workout plan',
                icon: Icons.fitness_center,
                onPressed: () {
                  context.pop();
                  BlocProvider.of<BottomBarCubit>(context)
                      .controller
                      .jumpToTab(3);
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
