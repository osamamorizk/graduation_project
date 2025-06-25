import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/widgets/custom_circle_progress_indicator.dart';
import 'package:graduation_project/core/widgets/error_view.dart';
import 'package:graduation_project/feature/diet/presentation/manger/cubit/diet_general_cubit.dart';
import 'package:graduation_project/feature/diet/presentation/views/widgets/genneral_plan_diet_collection.dart';

class DietGeneralPlans extends StatelessWidget {
  const DietGeneralPlans({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: RefreshIndicator(
        onRefresh: () async {
          context.read<DietGeneralCubit>().getAllDietPlans();
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
                        context.pushNamed(Routes.generalDietPlanDetailsView);
                      },
                      child: GenneralPlanDietColllection(
                        dietGpModel: state.dietPlans[index],
                      ),
                    ),
                  );
                },
              );
            } else if (state is GeneralDietCubitFailure) {
              return ErrorView(errorMessage: state.errorMessage);
            } else {
              return const CustomCircleProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
