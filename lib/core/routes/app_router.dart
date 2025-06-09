import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/helpers/cashe_helper.dart';
import 'package:graduation_project/core/helpers/service_locator.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/feature/bottom_nav_bar/presentation/views/bottom_bar.dart';
import 'package:graduation_project/feature/diet/data/repos/diet_repo_impl.dart';
import 'package:graduation_project/feature/diet/presentation/manger/cubit/diet_cubit.dart';
import 'package:graduation_project/feature/diet/presentation/views/widgets/general_plan_details_view.dart';
import 'package:graduation_project/feature/diet/presentation/views/widgets/genral_plan_meal_details.dart';
import 'package:graduation_project/feature/drink_water/data/repos/water_repo_impl.dart';
import 'package:graduation_project/feature/drink_water/presentation/manger/drink_water_cubit/water_record_cubit.dart';
import 'package:graduation_project/feature/drink_water/presentation/views/drink_water_view.dart';
import 'package:graduation_project/feature/login/data/repos/login_repo_impl.dart';
import 'package:graduation_project/feature/login/presentation/manger/cubit/login_cubit.dart';
import 'package:graduation_project/feature/login/presentation/views/forget_password.dart';
import 'package:graduation_project/feature/login/presentation/views/login_view.dart';
import 'package:graduation_project/feature/login/presentation/views/verification.dart';
import 'package:graduation_project/feature/onboarding/presentation/views/onboarding_view.dart';
import 'package:graduation_project/feature/profile/data/repos/profile_repo_impl.dart';
import 'package:graduation_project/feature/profile/presentation/manger/cubit/profile_cubit.dart';
import 'package:graduation_project/feature/profile/presentation/views/my_data_view.dart';
import 'package:graduation_project/feature/scan_food/data/models/scan_food_model.dart';

import 'package:graduation_project/feature/scan_food/presentation/views/widgets/food_details_view.dart';
import 'package:graduation_project/feature/sign_up/data/repos/sign_up_repo_implem.dart';
import 'package:graduation_project/feature/sign_up/presentation/manger/cubit/signup_cubit.dart';
import 'package:graduation_project/feature/sign_up/presentation/views/sign_up_view.dart';
import 'package:graduation_project/feature/user_data_form/data/repos/user_data_repo_impl.dart';
import 'package:graduation_project/feature/user_data_form/presentation/manger/cubit/user_data_cubit.dart';
import 'package:graduation_project/feature/user_data_form/presentation/views/user_data_form.dart';
import 'package:graduation_project/feature/workout/data/repos/workout_repo_impl.dart';
import 'package:graduation_project/feature/workout/presentation/manger/worlout_cubit/workout_cubit.dart';
import 'package:graduation_project/feature/workout/presentation/views/widgets/exercise_list_view.dart';
import 'package:graduation_project/feature/workout/presentation/views/widgets/general_workout_plan_exercises.dart';
import 'package:graduation_project/feature/workout/presentation/views/widgets/workout_exercise_details.dart';
import 'package:graduation_project/feature/workout/presentation/views/widgets/workout_general_plan_days.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(
          builder: (_) => const OnboardingView(),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginCubit(getIt.get<LoginRepoImpl>()),
            child: const LoginView(),
          ),
        );

      case Routes.signUp:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SignupCubit(getIt.get<SignUpRepoImplem>()),
            child: const SignUpView(),
          ),
        );
      case Routes.bottomBar:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => WorkoutCubit(getIt.get<WorkoutRepoImpl>())
                  ..getWorkoutPlans(id: CasheHlper.getInt(key: 'userId')),
              ),
              BlocProvider(
                create: (context) => DietCubit(getIt.get<DietRepoImpl>())
                  ..getAllDietsPlan(id: CasheHlper.getInt(key: 'userId')),
              ),
            ],
            child: const BottomBar(),
          ),
        );
      case Routes.dataForm:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => UserDataCubit(getIt.get<UserDataRepoImpl>()),
            child: UserDataForm(
              category: (settings.arguments as String?) ?? 'all',
            ),
          ),
        );

      case Routes.foodDetailsView:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => FoodDetailsPage(
            scanedFoodList: args['scanedFoodList'] as List<ScanFoodModel>,
            imagePath: args['imagePath'] as String,
          ),
        );

      case Routes.forgetPassword:
        return MaterialPageRoute(
          builder: (_) => const ForgetPassword(),
        );
      case Routes.verification:
        return MaterialPageRoute(
          builder: (_) => const Verification(),
        );

      case Routes.myDataView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ProfileCubit(getIt.get<ProfileRepoImpl>())
              ..getProfile(id: CasheHlper.getData(key: 'userId')),
            child: const MyDataView(),
          ),
        );

      case Routes.exerciseListView:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => ExerciseListView(
            exerciseGroup: args['exerciseGroup'] as String,
            exerciseId: args['id'] as int,
          ),
        );

      case Routes.generalDietPlanDetailsView:
        return MaterialPageRoute(
          builder: (context) => const GeneralDietPlanDetailsView(),
        );

      case Routes.generalDietMealDetails:
        return MaterialPageRoute(
          builder: (context) => const GenralPlanMealDetails(),
        );
      case Routes.generalWorkoutPlansDays:
        return MaterialPageRoute(
          builder: (context) => const WorkoutGeneralPlanDays(),
        );
      case Routes.exercisesByDay:
        return MaterialPageRoute(
          builder: (context) => const GeneralWorkoutPlanExercises(),
        );
      case Routes.workoutExerciseDetails:
        return MaterialPageRoute(
          builder: (context) => const WorkoutExerciseDetails(),
        );

      case Routes.drinkWaterRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => WaterRecordCubit(getIt.get<WaterRepoImpl>())
              ..featchWaterRecords(),
            child: const WaterTrackerScreen(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route founded in ${settings.name}')),
          ),
        );
    }
  }
}
