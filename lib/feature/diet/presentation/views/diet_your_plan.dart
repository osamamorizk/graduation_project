import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/helpers/cashe_helper.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/widgets/sticky_hidder_for_days.dart';
import 'package:graduation_project/feature/diet/presentation/manger/cubit/diet_cubit.dart';
import 'package:graduation_project/feature/diet/presentation/views/widgets/diet_days_list.dart';
import 'package:graduation_project/feature/diet/presentation/views/widgets/diet_meal_list_view.dart';

class DietYourPlan extends StatelessWidget {
  const DietYourPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Colors.white,
      backgroundColor: ColorsManger.darkBlue,
      onRefresh: () async {
        return context
            .read<DietCubit>()
            .getAllDietsPlan(id: CacheHelper.getInt(key: 'id'));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              floating: true,
              pinned: true,
              delegate: StickyHeaderDelegate(
                child: const DietDaysList(),
              ),
            ),
            SliverToBoxAdapter(child: verticalSpace(8)),
            const DietMealsListView()
          ],
        ),
      ),
    );
  }
}
