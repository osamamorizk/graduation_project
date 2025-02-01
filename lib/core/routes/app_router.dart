import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/helpers/cashe_helper.dart';
import 'package:graduation_project/core/helpers/service_locator.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/feature/bottom_nav_bar/presentation/views/bottom_bar.dart';
import 'package:graduation_project/feature/diet/data/repos/diet_repo_impl.dart';
import 'package:graduation_project/feature/diet/presentation/manger/cubit/diet_cubit.dart';
import 'package:graduation_project/feature/login/data/repos/login_repo_impl.dart';
import 'package:graduation_project/feature/login/presentation/manger/cubit/login_cubit.dart';
import 'package:graduation_project/feature/login/presentation/views/forget_password.dart';
import 'package:graduation_project/feature/login/presentation/views/login_view.dart';
import 'package:graduation_project/feature/login/presentation/views/verification.dart';
import 'package:graduation_project/feature/onboarding/presentation/views/onboarding_view.dart';
import 'package:graduation_project/feature/profile/presentation/views/my_data_view.dart';
import 'package:graduation_project/feature/sign_up/data/repos/sign_up_repo_implem.dart';
import 'package:graduation_project/feature/sign_up/presentation/manger/cubit/signup_cubit.dart';
import 'package:graduation_project/feature/sign_up/presentation/views/sign_up_view.dart';
import 'package:graduation_project/feature/user_data_form/data/repos/user_data_repo_impl.dart';
import 'package:graduation_project/feature/user_data_form/presentation/manger/cubit/user_data_cubit.dart';
import 'package:graduation_project/feature/user_data_form/presentation/views/user_data_form.dart';
import 'package:graduation_project/feature/workout/data/repos/workout_repo_impl.dart';
import 'package:graduation_project/feature/workout/presentation/manger/exercise_cubit/exercise_cubit.dart';
import 'package:graduation_project/feature/workout/presentation/manger/worlout_cubit/workout_cubit.dart';
import 'package:graduation_project/feature/workout/presentation/views/widgets/exercise_list_view.dart';

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
                  ..getWorkoutPlans(id: CasheHlper.getData(key: 'id') ?? 15),
              ),
              BlocProvider(
                create: (context) => DietCubit(getIt.get<DietRepoImpl>())
                  ..getAllDietsPlan(id: CasheHlper.getData(key: 'id') ?? 15),
              ),
              BlocProvider(
                  create: (context) =>
                      ExerciseCubit(getIt.get<WorkoutRepoImpl>())),
            ],
            child: const BottomBar(),
          ),
        );
      case Routes.dataForm:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => UserDataCubit(getIt.get<UserDataRepoImpl>()),
            child: UserDataForm(
              category: settings.arguments as String,
            ),
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
          builder: (_) => const MyDataView(),
        );

      case Routes.exerciseListView:
        return MaterialPageRoute(
          builder: (context) => ExerciseListView(
            exerciseGroup: settings.arguments as String,
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
