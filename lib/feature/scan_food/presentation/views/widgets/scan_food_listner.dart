import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/functions/error_dialog.dart';
import 'package:graduation_project/core/functions/upload_data_dialog.dart';
import 'package:graduation_project/feature/scan_food/presentation/manger/cubit/scan_food_cubit.dart';
import 'package:graduation_project/feature/scan_food/presentation/views/widgets/dish_dialog.dart';

class ScanFoodListner extends StatelessWidget {
  const ScanFoodListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ScanFoodCubit, ScanFoodState>(
      listener: (context, state) {
        if (state is ScanFoodLoading) {
          showLoadingDialog(context,
              loadingMessage: 'Scanning food..\nPlease wait');
        } else if (state is ScanFoodSuccess) {
          showDishDialog(context, state.scanFoodList[0]);
        } else if (state is ScanFoodFailure) {
          showErrorDialog(context, errorMessage: state.errorMessage);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
