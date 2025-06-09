import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/widgets/calories_and_time.dart';
import 'package:graduation_project/core/widgets/image_and_title_widget.dart';

class GeneralWorkoutPlanExercises extends StatelessWidget {
  const GeneralWorkoutPlanExercises({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ImageAndTitleWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -25,
                    left: MediaQuery.of(context).size.width / 20,
                    child: CalorisAndTimeWidget(
                      widget: Row(
                        children: [
                          const SizedBox(
                            height: 12,
                            child: VerticalDivider(
                              thickness: 1.5,
                              width: 15,
                              color: ColorsManger.grey,
                            ),
                          ),
                          Text(
                            'Easy',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      separatorBuilder: (context, index) => const Divider(
                        color: ColorsManger.lighterGrey,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            context.pushNamed(Routes.workoutExerciseDetails);
                          },
                          child: const TitleAndTimeWidget(
                            title: 'Exercise 1',
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TitleAndTimeWidget extends StatelessWidget {
  const TitleAndTimeWidget({
    super.key,
    required this.title,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return ListTile(
      tileColor: Colors.transparent,
      leading: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: 16.sp,
            ),
      ),
      trailing: FittedBox(
        child: Row(
          spacing: 5,
          children: [
            SvgPicture.asset(
              colorFilter: ColorFilter.mode(
                isDarkMode ? ColorsManger.neonPurple : ColorsManger.darkBlue,
                BlendMode.srcIn,
              ),
              Assets.svgsClock,
              height: 18,
            ),
            Text(
              '10 min',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(fontWeight: FontWeight.normal),
            )
          ],
        ),
      ),
    );
  }
}
