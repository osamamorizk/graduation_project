import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/helpers/cashe_helper.dart';
import 'package:graduation_project/core/helpers/const.dart';
import 'package:graduation_project/core/helpers/my_bloc_observer.dart';
import 'package:graduation_project/core/helpers/notification_serivce.dart';
import 'package:graduation_project/core/helpers/service_locator.dart';
import 'package:graduation_project/core/routes/app_router.dart';
import 'package:graduation_project/feature/drink_water/data/models/water_record_model.dart';
import 'package:graduation_project/fit_app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:timezone/data/latest_all.dart' as tz;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  await Hive.initFlutter();
  Hive.registerAdapter<WaterRecordModel>(WaterRecordModelAdapter());
  await Hive.openBox<WaterRecordModel>(kWaterRimenderBox);
  await Hive.openBox(kDrinkWaterParmeters);
  setupServiceLocator();
  Bloc.observer = MyBlocObserver();

  await CasheHlper.casheIntialization();
  await ScreenUtil.ensureScreenSize();
  await getIt<NotificationService>().requestPermissions();
  await getIt<NotificationService>().initialize();
  // await getIt<NotificationService>().scheduleNotification(
  //   title: 'Nutrix',
  //   body:
  //       "Don't forget to stay on track with your diet and workout routine today!",
  // );
  runApp(
    FitApp(
      appRouter: AppRouter(),
    ),
  );
}
