import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/helpers/cashe_helper.dart';
import 'package:graduation_project/core/routes/app_router.dart';
import 'package:graduation_project/fit_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CasheHlper.casheIntialization();
  await ScreenUtil.ensureScreenSize();

  runApp(
    FitApp(
      appRouter: AppRouter(),
    ),
  );
}
