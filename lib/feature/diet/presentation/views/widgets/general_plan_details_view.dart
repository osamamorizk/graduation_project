import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/core/widgets/day_container.dart';
import 'package:graduation_project/feature/diet/presentation/views/widgets/diet_general_plan_item.dart';

class GeneralDietPlanDetailsView extends StatefulWidget {
  const GeneralDietPlanDetailsView({super.key});

  @override
  State<GeneralDietPlanDetailsView> createState() =>
      _GeneralDietPlanDetailsViewState();
}

class _GeneralDietPlanDetailsViewState
    extends State<GeneralDietPlanDetailsView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        titleSpacing: 0,
        toolbarHeight: 40,
        iconTheme: const IconThemeData(size: 22),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Balanced Diet',
                    style: TextStyles.font18BlackBold,
                  ),
                  Text(
                    'Healthy and nutritious food recipes',
                    style: TextStyles.font14greyNormal
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 50.h,
                child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        child: DayContainer(
                            day: 'Breakfast',
                            isSelected: currentIndex == index));
                  },
                ),
              ),
            ),
            SliverList.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: GpMealItem(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
