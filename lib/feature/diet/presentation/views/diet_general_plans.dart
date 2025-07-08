import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/widgets/error_view.dart';
import 'package:graduation_project/core/widgets/shimmer_loading.dart';
import 'package:graduation_project/feature/diet/presentation/manger/cubit/diet_general_cubit.dart';
import 'package:graduation_project/feature/diet/presentation/views/widgets/genneral_plan_diet_collection.dart';

class DietGeneralPlans extends StatelessWidget {
  const DietGeneralPlans({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: RefreshIndicator(
        onRefresh: () {
          return context.read<DietGeneralCubit>().getAllDietPlans();
        },
        child: BlocBuilder<DietGeneralCubit, DietGeneralCubitState>(
          buildWhen: (previous, current) =>
              current is GeneralDietCubitSuccess ||
              current is GeneralDietCubitFailure ||
              current is GeneralDietCubitLoading,
          builder: (context, state) {
            if (state is GeneralDietCubitSuccess) {
              return ListView.builder(
                itemCount: state.dietPlans.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: InkWell(
                      onTap: () {
                        context.read<DietGeneralCubit>().getDietPlanDetails(
                              id: state.dietPlans[index].id ?? 0,
                            );
                        context.pushNamed(Routes.generalDietPlanDetailsView);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom:
                                index == state.dietPlans.length - 1 ? 16 : 0),
                        child: GenneralPlanDietColllection(
                          dietGpModel: state.dietPlans[index],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (state is GeneralDietCubitFailure) {
              return ListView(
                children: [
                  Center(child: ErrorView(errorMessage: state.errorMessage)),
                ],
              );
            } else {
              return const ShimmerLoadingWidget(
                height: 110,
                itemCount: 5,
              );
            }
          },
        ),
      ),
    );
  }
}
