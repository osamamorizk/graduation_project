import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/helpers/cashe_helper.dart';
import 'package:graduation_project/core/helpers/my_bloc_observer.dart';
import 'package:graduation_project/core/helpers/service_locator.dart';
import 'package:graduation_project/core/routes/app_router.dart';
import 'package:graduation_project/fit_app.dart';

Future<void> main() async {
  setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await CasheHlper.casheIntialization();
  await ScreenUtil.ensureScreenSize();

  runApp(
    FitApp(
      appRouter: AppRouter(),
    ),
  );
}
