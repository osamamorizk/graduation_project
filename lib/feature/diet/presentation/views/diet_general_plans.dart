import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/feature/diet/presentation/views/widgets/genneral_plan_diet_item.dart';

class DietGeneralPlans extends StatelessWidget {
  const DietGeneralPlans({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 16),
            child: InkWell(
                onTap: () {
                  context.pushNamed(Routes.generalDietPlanDetailsView);
                },
                child: const GenneralPlanDietItem()),
          );
        },
      ),
    );
  }
}
