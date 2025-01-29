import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/helpers/spacing.dart';

import 'package:graduation_project/feature/onboarding/data/onbarding_list.dart';
import 'package:graduation_project/feature/onboarding/presentation/views/widgets/actions_onboarding.dart';
import 'package:graduation_project/feature/onboarding/presentation/views/widgets/custom_indicator.dart';

import 'package:graduation_project/feature/onboarding/presentation/views/widgets/onboarding_item.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late final PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: onboardingList.length,
                itemBuilder: (context, index) {
                  return OnboardingItem(
                    onboardingModel: onboardingList[index],
                  );
                },
              ),
            ),
            verticalSpace(16.h),
            CustomIndicator(pageController: pageController),
            verticalSpace(16.h),
            const ActionsOnboarding(),
            verticalSpace(45),
          ],
        ),
      ),
    );
  }
}
