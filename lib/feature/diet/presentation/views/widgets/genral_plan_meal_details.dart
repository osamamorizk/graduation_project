import 'package:flutter/material.dart';

import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/widgets/image_and_title_widget.dart';
import 'package:graduation_project/core/widgets/playing_video_widget.dart';
import 'package:graduation_project/core/widgets/calories_and_time.dart';
import 'package:graduation_project/feature/diet/presentation/views/widgets/general_plan_meal_info.dart';
import 'package:graduation_project/feature/diet/presentation/views/widgets/nutrition_info.dart';

class GenralPlanMealDetails extends StatelessWidget {
  const GenralPlanMealDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            floating: true,
            pinned: true,
            stretch: true,
            shadowColor: Colors.transparent,
            scrolledUnderElevation: 0,
            expandedHeight: 250,
            toolbarHeight: 0,
            flexibleSpace: FlexibleSpaceBar(background: ImageAndTitleWidget()),
          ),
          SliverToBoxAdapter(child: verticalSpace(50)),
          const SliverToBoxAdapter(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: -50,
                  right: 20,
                  child: CalorisAndTimeWidget(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NutritionItem(title: 'Fat', value: '1.5 g'),
                    NutritionItem(title: 'Protein', value: '10.9 g'),
                    NutritionItem(title: 'Carbs', value: '13.5 g'),
                  ],
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: GeneralPlanMealInformation(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomAppBar(
        color: Colors.transparent,
        child: PlayingVideoWidget(),
      ),
    );
  }
}
