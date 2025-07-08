import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';

class EmptyChatBody extends StatelessWidget {
  const EmptyChatBody({
    super.key,
    required this.isDarkMode,
    this.onFitnessTap,
    this.onNutritionTap,
  });
  final void Function()? onFitnessTap;
  final void Function()? onNutritionTap;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 50,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Select the chatbot\'s role:',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Row(
          spacing: 40,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoleWidget(
              onTap: onNutritionTap,
              image: Assets.imagesNutrationest,
              title: 'Nutritionist',
            ),
            RoleWidget(
              onTap: onFitnessTap,
              image: Assets.imagesFitnessCoach,
              title: 'Fitness Coach',
            )
          ],
        ),
      ],
    );
  }
}

class RoleWidget extends StatelessWidget {
  const RoleWidget({
    super.key,
    required this.image,
    this.onTap,
    required this.title,
  });
  final String image;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        spacing: 16,
        children: [
          CircleAvatar(
            radius: 75,
            backgroundImage: AssetImage(image),
          ),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}


//Center(
    //     child: Column(
    //   spacing: 10,
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     CircleAvatar(
    //       radius: 65,
    //       backgroundColor:
    //           isDarkMode ? ColorsManger.neonPurple : ColorsManger.darkBlue,
    //       child: SvgPicture.asset(
    //         Assets.svgsChatbotLogo,
    //         width: 90,
    //         height: 100,
    //         fit: BoxFit.fill,
    //       ),
    //     ),
    //     Text(
    //       'Welcome! I’m NUTRIBOT\nyour guide to a healthier, stronger you.',
    //       style: Theme.of(context).textTheme.headlineLarge,
    //       textAlign: TextAlign.center,
    //     ),
    //   ],
    // ));

      // const SizedBox(width: 20),
      //   Text(
      //     'Welcome! I’m NUTRIBOT\nyour guide to a healthier, stronger you.',
      //     style: Theme.of(context).textTheme.headlineLarge,
      //     textAlign: TextAlign.center,
      //   ),