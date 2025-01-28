import 'package:flutter/material.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/feature/workout/presentation/views/widgets/exercise_item.dart';

class ExerciseListView extends StatelessWidget {
  const ExerciseListView({
    super.key,
    required this.exerciseGroup,
  });
  final String exerciseGroup;
  @override
  Widget build(BuildContext context) {
    // final name = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 45,
        titleSpacing: 0,
        title: Text(
          '$exerciseGroup Exercises',
          style: TextStyles.font20BlackRegular,
        ),
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.black, size: 22),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          itemBuilder: (context, index) => const ExerciseItem(),
          itemCount: 8,
        ),
      ),
    );
  }
}
