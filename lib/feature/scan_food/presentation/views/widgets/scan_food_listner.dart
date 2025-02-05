import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/functions/error_dialog.dart';
import 'package:graduation_project/core/functions/upload_data_dialog.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/feature/scan_food/presentation/manger/cubit/scan_food_cubit.dart';

class ScanFoodListner extends StatelessWidget {
  const ScanFoodListner({
    super.key,
    required this.imagePath,
  });
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ScanFoodCubit, ScanFoodState>(
      listener: (context, state) {
        if (state is ScanFoodLoading) {
          showLoadingDialog(context,
              loadingMessage: 'Scanning food..\nPlease wait');
        } else if (state is ScanFoodSuccess) {
          context.pop();
          context.pushReplacementNamed(
            Routes.foodDetailsView,
            arguments: {
              'scanedFoodList': state.scanFoodList,
              'imagePath': imagePath,
            },
          );
          // showDishDialog(context, state.scanFoodList[0]);
        } else if (state is ScanFoodFailure) {
          context.pop();
          showErrorDialog(context, errorMessage: state.errorMessage);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
