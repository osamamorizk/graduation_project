import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'package:graduation_project/core/helpers/cache_helper.dart';
import 'package:graduation_project/core/helpers/const.dart';
import 'package:graduation_project/core/helpers/my_bloc_observer.dart';
import 'package:graduation_project/core/helpers/service_locator.dart';
import 'package:graduation_project/core/routes/app_router.dart';
import 'package:graduation_project/feature/chatbot/data/models/message_model.dart';
import 'package:graduation_project/feature/drink_water/data/models/water_record_model.dart';
import 'package:graduation_project/feature/drink_water/data/repos/notification_repo.dart';
import 'package:graduation_project/nutrix_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _initializeTimezone();
  await _initializeHive();
  await _initializeDependencies();
  await _initializeNotifications();

  runApp(NutrixApp(appRouter: AppRouter()));
}

Future<void> _initializeTimezone() async {
  tz.initializeTimeZones();
  final localTimezone = await FlutterTimezone.getLocalTimezone();
  tz.setLocalLocation(tz.getLocation(localTimezone));
}

Future<void> _initializeHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter<WaterRecordModel>(WaterRecordModelAdapter());
  Hive.registerAdapter<MessageModel>(MessageModelAdapter());

  await Hive.openBox<WaterRecordModel>(kWaterRimenderBox);
  await Hive.openBox<MessageModel>(kChatMessages);
  await Hive.openBox(kDrinkWaterParmeters);
  await CacheHelper.casheIntialization();
}

Future<void> _initializeDependencies() async {
  setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  await ScreenUtil.ensureScreenSize();
}

Future<void> _initializeNotifications() async {
  final notificationRepository = NotificationRepository();
  await notificationRepository.initAndRequestPermissions();
}
