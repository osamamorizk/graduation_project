import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/core/widgets/calories_and_time.dart';
import 'package:graduation_project/core/widgets/image_and_title_widget.dart';

class WorkoutGeneralPlanDays extends StatelessWidget {
  const WorkoutGeneralPlanDays({super.key});

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
                    child: CalorisAndTimeWidget(
                      widget: Row(
                        children: [
                          const SizedBox(
                            height: 12,
                            child: VerticalDivider(
                              thickness: 1.3,
                              width: 15,
                              color: ColorsManger.grey,
                            ),
                          ),
                          Text(
                            'Easy',
                            style:
                                TextStyles.font14Regular.copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: 4,
                      separatorBuilder: (context, index) => const Divider(
                        color: ColorsManger.lighterGrey,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              context.pushNamed(Routes.exercisesByDay);
                            },
                            child: const DaysAndTimeWidget());
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

class DaysAndTimeWidget extends StatelessWidget {
  const DaysAndTimeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        'Day 1',
        style: TextStyles.font16BlackBold,
      ),
      trailing: FittedBox(
        child: Row(
          spacing: 5,
          children: [
            SvgPicture.asset(
              Assets.svgsClock,
              height: 18,
            ),
            Text(
              '10 min',
              style: TextStyles.font14Regular
                  .copyWith(fontWeight: FontWeight.normal),
            )
          ],
        ),
      ),
    );
  }
}
