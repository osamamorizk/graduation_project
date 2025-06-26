import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/helpers/cache_helper.dart';
import 'package:graduation_project/core/helpers/const.dart';
import 'package:graduation_project/core/helpers/service_locator.dart';
import 'package:graduation_project/core/routes/app_router.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/themes/app_themes.dart';
import 'package:graduation_project/feature/bottom_nav_bar/presentation/manger/cubit/theme_cubit_cubit.dart';
import 'package:graduation_project/feature/diet/data/repos/diet_gp_repo/diet_general_plan_repo_impl.dart';
import 'package:graduation_project/feature/diet/presentation/manger/cubit/diet_general_cubit.dart';
import 'package:graduation_project/feature/home/data/repos/challenge_repo_impl.dart';
import 'package:graduation_project/feature/home/presentation/manger/cubit/challenge_cubit.dart';
import 'package:graduation_project/feature/scan_food/data/repos/scan_food_repo_impl.dart';
import 'package:graduation_project/feature/scan_food/presentation/manger/cubit/scan_food_cubit.dart';
import 'package:graduation_project/feature/workout/data/repos/general_plan_repo/general_plan_repo_impl.dart';
import 'package:graduation_project/feature/workout/data/repos/workout_repo/workout_repo_impl.dart';
import 'package:graduation_project/feature/workout/presentation/manger/exercise_cubit/exercise_cubit.dart';
import 'package:graduation_project/feature/workout/presentation/manger/general_plan_cubit/workout_general_plan_cubit.dart';

class NutrixApp extends StatelessWidget {
  const NutrixApp({super.key, required this.appRouter});
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
            create: (context) =>
                WorkoutGeneralPlanCubit(getIt.get<GeneralWorkoutPlanRepoImpl>())
                  ..getGeneralWorkoutPlan(),
          ),
          BlocProvider(
            create: (context) => ScanFoodCubit(getIt.get<ScanFoodRepoImpl>()),
          ),
          BlocProvider(
            create: (context) =>
                DietGeneralCubit(getIt.get<DietGeneralPlanRepoImpl>())
                  ..getAllDietPlans(),
          ),
          BlocProvider(
            create: (context) =>
                ChallengeCubit(getIt.get<ChallengeRepoImpl>())..getChallenges(),
          ),
          BlocProvider(
            create: (context) => ThemeCubit()..loadTheme(),
          ),
        ],
        child: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, themMode) {
            return MaterialApp(
              key: navigatorKey,
              theme: AppThemes.lightTheme,
              darkTheme: AppThemes.darkTheme,
              themeMode: themMode,
              debugShowCheckedModeBanner: false,
              onGenerateRoute: appRouter.generateRoute,
              initialRoute: (CacheHelper.getData(key: 'login') ?? false)
                  ? (CacheHelper.getData(key: 'dataDone') ?? false)
                      ? Routes.bottomBar
                      : Routes.dataForm
                  : Routes.onboarding,
            );
          },
        ),
      ),
    );
  }
}
