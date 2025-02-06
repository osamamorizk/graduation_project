import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/helpers/cashe_helper.dart';
import 'package:graduation_project/core/helpers/service_locator.dart';
import 'package:graduation_project/core/routes/app_router.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/feature/scan_food/data/repos/scan_food_repo_impl.dart';
import 'package:graduation_project/feature/scan_food/presentation/manger/cubit/scan_food_cubit.dart';
import 'package:graduation_project/feature/workout/data/repos/workout_repo_impl.dart';
import 'package:graduation_project/feature/workout/presentation/manger/exercise_cubit/exercise_cubit.dart';

class FitApp extends StatelessWidget {
  const FitApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ExerciseCubit(getIt.get<WorkoutRepoImpl>()),
          ),
          BlocProvider(
            create: (context) => ScanFoodCubit(getIt.get<ScanFoodRepoImpl>()),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(scaffoldBackgroundColor: Colors.white),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRouter.generateRoute,
          initialRoute: (CasheHlper.getData(key: 'login') ?? false)
              ? (CasheHlper.getData(key: 'dataDone') ?? false)
                  ? Routes.bottomBar
                  : Routes.dataForm
              : Routes.onboarding,
        ),
      ),
    );
  }
}
