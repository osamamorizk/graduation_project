import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:graduation_project/core/networking/api_service.dart';
import 'package:graduation_project/feature/chatbot/data/repos/chat_bot_repo.dart';
import 'package:graduation_project/feature/diet/data/repos/diet_gp_repo/diet_general_plan_repo_impl.dart';
import 'package:graduation_project/feature/diet/data/repos/diet_repo_impl.dart';
import 'package:graduation_project/feature/drink_water/data/repos/notification_repo.dart';
import 'package:graduation_project/feature/drink_water/data/repos/water_repo_impl.dart';
import 'package:graduation_project/feature/login/data/repos/login_repo_impl.dart';
import 'package:graduation_project/feature/profile/data/repos/profile_repo_impl.dart';
import 'package:graduation_project/feature/scan_food/data/repos/scan_food_repo_impl.dart';
import 'package:graduation_project/feature/sign_up/data/repos/sign_up_repo_implem.dart';
import 'package:graduation_project/feature/user_data_form/data/repos/user_data_repo_impl.dart';
import 'package:graduation_project/feature/workout/data/repos/general_plan_repo/general_plan_repo_impl.dart';
import 'package:graduation_project/feature/workout/data/repos/workout_repo/workout_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<WorkoutRepoImpl>(
    WorkoutRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<DietRepoImpl>(
    DietRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton<UserDataRepoImpl>(
    UserDataRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<DietGeneralPlanRepoImpl>(
    DietGeneralPlanRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<LoginRepoImpl>(
    LoginRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton<ChatBotRepo>(ChatBotRepo());

  getIt.registerSingleton<SignUpRepoImplem>(
    SignUpRepoImplem(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<ScanFoodRepoImpl>(
    ScanFoodRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<ProfileRepoImpl>(
    ProfileRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<WaterRepoImpl>(
    WaterRepoImpl(),
  );
  getIt.registerSingleton<NotificationRepository>(
    NotificationRepository(),
  );
  getIt.registerSingleton<GeneralWorkoutPlanRepoImpl>(
    GeneralWorkoutPlanRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
}
