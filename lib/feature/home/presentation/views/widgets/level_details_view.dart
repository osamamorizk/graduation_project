import 'package:flutter/material.dart';
import 'package:graduation_project/feature/home/presentation/views/widgets/daily_list_tile.dart';
import 'package:graduation_project/feature/home/presentation/views/widgets/description_card.dart';

class LevelDetailsView extends StatelessWidget {
  const LevelDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        title: Text(
          'Level 1',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            const DescriptionCard(),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: const [
                  DayTaskTile(
                    dayTitle: "Day one: Clear the junk",
                    content:
                        "Clean your fridge and pantry and remove (or hide) junk food and processed snacks.\n\nTip: If it has more than ten ingredients or unpronounceable ones, toss it or set it aside.",
                  ),
                  DayTaskTile(dayTitle: "Day two: Hydration Boost"),
                  DayTaskTile(dayTitle: "Day three: Whole Breakfast"),
                  DayTaskTile(dayTitle: "Day four: No Added Sugar"),
                  DayTaskTile(dayTitle: "Day five: Eat the Rainbow"),
                ],
              ),
            ),
            // const FinishButton(),
          ],
        ),
      ),
    );
  }
}
