import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/routes/app_router.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/feature/bottom_nav_bar/presentation/manger/cubit/bottom_bar_cubit.dart';

class FitApp extends StatelessWidget {
  const FitApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: BlocProvider(
        create: (context) => BottomBarCubit(),
        child: MaterialApp(
          theme: ThemeData(scaffoldBackgroundColor: Colors.white),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRouter.generateRoute,
          initialRoute: Routes.dataForm,
        ),
      ),
    );
  }
}
