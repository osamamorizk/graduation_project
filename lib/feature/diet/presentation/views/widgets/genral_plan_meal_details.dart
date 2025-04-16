import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/widgets/playing_video_widget.dart';
import 'package:graduation_project/feature/diet/presentation/views/widgets/general_plan_diet_info.dart';
import 'package:graduation_project/feature/diet/presentation/views/widgets/general_plan_meal_info.dart';
import 'package:graduation_project/feature/diet/presentation/views/widgets/nutrition_info.dart';

class GenralPlanMealDetails extends StatelessWidget {
  const GenralPlanMealDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                Image.asset(Assets.imagesGeneralPlansGeneralDiet),
                Positioned(
                  top: 15,
                  child: IconButton(
                    onPressed: () => context.pop(),
                    icon: const Icon(
                      size: 20,
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Positioned(
                  bottom: -20,
                  right: 20,
                  child: GpDietInfo(),
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: verticalSpace(15),
          ),
          const SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NutritionItem(title: 'Fat', value: '1.5 g'),
                NutritionItem(title: 'Protein', value: '10.9 g'),
                NutritionItem(title: 'Carbs', value: '13.5 g'),
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: GeneralPlanMealInformation(),
            ),
          )
        ],
      ),
      bottomNavigationBar: const BottomAppBar(
        color: Colors.transparent,
        child: PlayingVideoWidget(),
      ),
    );
  }
}
