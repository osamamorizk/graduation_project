import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/widgets/error_view.dart';
import 'package:graduation_project/core/widgets/shimmer_loading.dart';
import 'package:graduation_project/feature/workout/presentation/manger/general_plan_cubit/workout_general_plan_cubit.dart';
import 'package:graduation_project/feature/workout/presentation/views/widgets/general_plan_item.dart';

class WorkoutGeneralPlansView extends StatefulWidget {
  const WorkoutGeneralPlansView({super.key});

  @override
  State<WorkoutGeneralPlansView> createState() =>
      _WorkoutGeneralPlansViewState();
}

class _WorkoutGeneralPlansViewState extends State<WorkoutGeneralPlansView>
    with AutomaticKeepAliveClientMixin<WorkoutGeneralPlansView> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
      color: Colors.white,
      backgroundColor: ColorsManger.darkBlue,
      onRefresh: () {
        return context.read<WorkoutGeneralPlanCubit>().getGeneralWorkoutPlan();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocBuilder<WorkoutGeneralPlanCubit, WorkoutGeneralPlanState>(
          builder: (context, state) {
            if (state is WorkoutGeneralPlanSuccess) {
              return ListView.separated(
                itemCount: state.genralPlanList.length,
                separatorBuilder: (context, index) => verticalSpace(16),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    context.pushNamed(Routes.generalWorkoutPlansDays,
                        arguments: state.genralPlanList[index].id);

                    context
                        .read<WorkoutGeneralPlanCubit>()
                        .getGeneralWorkoutPlanDetails(
                            id: state.genralPlanList[index].id ?? -1);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom:
                            index == state.genralPlanList.length - 1 ? 16 : 0),
                    child: GeneralPlanItem(
                      generalPLanModel: state.genralPlanList[index],
                    ),
                  ),
                ),
              );
            }
            if (state is WorkoutGeneralPlanFailure) {
              return ListView(
                children: [
                  ErrorView(errorMessage: state.error),
                ],
              );
            } else {
              return const ShimmerLoadingWidget(
                itemCount: 6,
                hight: 95,
              );
            }
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
