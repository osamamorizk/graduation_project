import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/feature/bottom_nav_bar/presentation/views/bottom_bar.dart';
import 'package:graduation_project/feature/login/presentation/views/forget_password.dart';
import 'package:graduation_project/feature/login/presentation/views/login_view.dart';
import 'package:graduation_project/feature/login/presentation/views/verification.dart';
import 'package:graduation_project/feature/onboarding/presentation/views/onboarding_view.dart';
import 'package:graduation_project/feature/sign_up/presentation/views/sign_up_view.dart';
import 'package:graduation_project/feature/user_data_form/presentation/manger/cubit/user_data_cubit.dart';
import 'package:graduation_project/feature/user_data_form/presentation/views/user_data_form.dart';
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
          builder: (_) => const LoginView(),
        );

      case Routes.signUp:
        return MaterialPageRoute(
          builder: (_) => const SignUpView(),
        );
      case Routes.bottomBar:
        return MaterialPageRoute(
          builder: (_) => const BottomBar(),
        );
      case Routes.dataForm:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => UserDataCubit(),
            child: const UserDataForm(),
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
