import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/widgets/details_section.dart';
import 'package:graduation_project/feature/diet/data/models/gp_meal_details_model/gp_meal_details_model.dart';

class GeneralPlanMealInformation extends StatelessWidget {
  const GeneralPlanMealInformation({
    super.key,
    required this.gpMealDetailsModel,
  });
  final GpMealDetailsModel gpMealDetailsModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(4),
        DetailsSection(
            title: 'Ingredients',
            details: gpMealDetailsModel.ingredients ?? []),
        DetailsSection(title: 'Steps', details: gpMealDetailsModel.steps ?? []),
        DetailsSection(
            title: 'Benefits', details: gpMealDetailsModel.benefits ?? []),
      ],
    );
  }
}
