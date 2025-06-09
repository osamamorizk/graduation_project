import 'package:flutter/material.dart';
import 'package:graduation_project/core/widgets/calories_and_time.dart';
import 'package:graduation_project/core/widgets/details_section.dart';
import 'package:graduation_project/core/widgets/image_and_title_widget.dart';
import 'package:graduation_project/core/widgets/playing_video_widget.dart';
import 'package:graduation_project/feature/workout/presentation/views/widgets/level_category_widget.dart';

class GeneralPlanWorkoutExerciseDetails extends StatelessWidget {
  const GeneralPlanWorkoutExerciseDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            stretch: true,
            shadowColor: Colors.transparent,
            scrolledUnderElevation: 0,
            expandedHeight: 250,
            toolbarHeight: 0,
            flexibleSpace: FlexibleSpaceBar(background: ImageAndTitleWidget()),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                CalorisAndTimeWidget(),
                LevelCategoryChips(),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailsSection(
                    title: 'How to do',
                    details: [
                      'Start Position: Stand upright with feet hip-width apart.'
                          'Step Forward: Take a big step forward with one leg.'
                          'Lower Body: Bend both knees until the back knee is close to the floor.'
                          'Push Up: Press through the front heel to return to the starting position.'
                          'Repeat: Switch legs and repeat.',
                    ],
                  ),
                  DetailsSection(title: 'Key Feature', details: [
                    'Targets: Quads, hamstrings, glutes.'
                        'Improves: Balance, stability, lower body strength.'
                        'Form Tip: Keep chest up and core engaged, avoid letting the front knee pass the toes.',
                  ]),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: PlayingVideoWidget(),
      ),
    );
  }
}
