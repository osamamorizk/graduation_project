import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/helpers/service_locator.dart';
import 'package:graduation_project/feature/scan_food/data/repos/scan_food_repo_impl.dart';
import 'package:graduation_project/feature/scan_food/presentation/manger/cubit/scan_food_cubit.dart';

import 'package:graduation_project/feature/scan_food/presentation/views/widgets/camera_window.dart';

class ScanFoodView extends StatelessWidget {
  const ScanFoodView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
      create: (context) => ScanFoodCubit(getIt.get<ScanFoodRepoImpl>()),
      child: const CameraWindow(),
    )

        // CameraWindow(),
        );
  }
}
