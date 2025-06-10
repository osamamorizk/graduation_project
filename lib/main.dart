import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:graduation_project/core/helpers/cashe_helper.dart';
import 'package:graduation_project/core/helpers/const.dart';
import 'package:graduation_project/core/helpers/my_bloc_observer.dart';
import 'package:graduation_project/core/helpers/service_locator.dart';
import 'package:graduation_project/core/routes/app_router.dart';
import 'package:graduation_project/feature/chatbot/data/models/message_model.dart';
import 'package:graduation_project/feature/drink_water/data/models/water_record_model.dart';
import 'package:graduation_project/fit_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();

  tz.setLocalLocation(tz.getLocation(await FlutterTimezone.getLocalTimezone()));
  await Hive.initFlutter();
  Hive.registerAdapter<WaterRecordModel>(WaterRecordModelAdapter());
  Hive.registerAdapter<MessageModel>(MessageModelAdapter());
  await Hive.openBox<WaterRecordModel>(kWaterRimenderBox);
  await Hive.openBox<MessageModel>(kChatMessages);
  await Hive.openBox(kDrinkWaterParmeters);

  setupServiceLocator();
  Bloc.observer = MyBlocObserver();

  await CasheHlper.casheIntialization();
  await ScreenUtil.ensureScreenSize();

  runApp(
    FitApp(
      appRouter: AppRouter(),
    ),
  );
}
