import 'package:flutter/material.dart';

class WorkoutYourPlanView extends StatelessWidget {
  const WorkoutYourPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NutritionPlanPage(),
    );
  }
}

class NutritionPlanPage extends StatelessWidget {
  const NutritionPlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your daily calories: 2300 cal',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'Protein: 30%   Carbs: 30%   Fats: 30%',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 4),
            Column(
              children: [
                const Text(
                  'Breakfast:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                buildOption('Ful Medames (1 cup)'),
                buildOption('Eggs (two)'),
                buildOption('Toast (1 slice)'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOption(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.circle, size: 10),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
