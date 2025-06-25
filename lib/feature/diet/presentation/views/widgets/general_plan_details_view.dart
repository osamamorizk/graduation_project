import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/core/widgets/custom_circle_progress_indicator.dart';
import 'package:graduation_project/core/widgets/day_container.dart';
import 'package:graduation_project/feature/diet/data/models/diet_gp_details_model/diet_gp_details_model.dart';
import 'package:graduation_project/feature/diet/presentation/manger/cubit/diet_general_cubit.dart';
import 'package:graduation_project/feature/diet/presentation/views/widgets/diet_general_plan_item.dart';

class GeneralPlanDetailsView extends StatelessWidget {
  const GeneralPlanDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DietGeneralCubit, DietGeneralCubitState>(
        buildWhen: (previous, current) =>
            current is GeneralDietCubitDetailsFailure ||
            current is GeneralDietCubitDetailsLoading ||
            current is GeneralDietCubitDetailsSuccess,
        builder: (context, state) {
          if (state is GeneralDietCubitDetailsSuccess) {
            return GeneralPlanDetailsBody(
              dietGpDetailsModel: state.dietPlanDetails,
            );
          } else if (state is GeneralDietCubitDetailsFailure) {
            return Center(
              child: Text(
                state.errorMessage,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            );
          } else {
            return const Center(child: CustomCircleProgressIndicator());
          }
        },
      ),
    );
  }
}

class GeneralPlanDetailsBody extends StatefulWidget {
  const GeneralPlanDetailsBody({super.key, required this.dietGpDetailsModel});
  final DietGpDetailsModel dietGpDetailsModel;
  @override
  State<GeneralPlanDetailsBody> createState() => _GeneralPlanDetailsBodyState();
}

class _GeneralPlanDetailsBodyState extends State<GeneralPlanDetailsBody> {
  int currentIndex = 0;
  @override
  void initState() {
    getCurrentMealList();
    super.initState();
  }

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
                    widget.dietGpDetailsModel.name ?? 'General Diet Plan',
                    style: TextStyles.font18Bold,
                  ),
                  Text(
                    widget.dietGpDetailsModel.description ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                  height: 50.h,
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              currentIndex = 0;
                            });
                          },
                          child: DayContainer(
                              day: 'Breakfast', isSelected: currentIndex == 0)),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              currentIndex = 1;
                            });
                          },
                          child: DayContainer(
                              day: 'Lunch', isSelected: currentIndex == 1)),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              currentIndex = 2;
                            });
                          },
                          child: DayContainer(
                              day: 'Dinner', isSelected: currentIndex == 2)),
                    ],
                  )),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final meals = getCurrentMealList();
                  final meal = meals[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: GestureDetector(
                      onTap: () {
                        context.pushNamed(
                          Routes.generalDietMealDetails,
                        );
                      },
                      child: GpMealItem(
                        imageUrl: meal.imageUrl,
                        name: meal.name,
                        calories: meal.calories,
                        time: meal.time,
                      ),
                    ),
                  );
                },
                childCount: getCurrentMealList().length,
              ),
            )
          ],
        ),
      ),
    );
  }

  List<dynamic> getCurrentMealList() {
    if (currentIndex == 0) {
      return widget.dietGpDetailsModel.breakfast ?? [];
    } else if (currentIndex == 1) {
      return widget.dietGpDetailsModel.lunch ?? [];
    } else {
      return widget.dietGpDetailsModel.dinner ?? [];
    }
  }
}
