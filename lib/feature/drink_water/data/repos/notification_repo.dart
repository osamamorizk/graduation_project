import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:graduation_project/core/functions/ask_permission_dailog.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationRepository {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    const androidInit = AndroidInitializationSettings('@mipmap/launcher_icon');
    const iosInit = DarwinInitializationSettings();
    const initSettings =
        InitializationSettings(android: androidInit, iOS: iosInit);

    await notificationsPlugin.initialize(initSettings);
  }

  Future<void> requestPermissions() async {
    await notificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    await notificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(alert: true, badge: true, sound: true);
  }

  Future<void> scheduleDrinkReminder(DateTime now, BuildContext context) async {
    final status = await Permission.notification.status;

    if (status.isPermanentlyDenied) {
      await askPermissionDialog(context);
      return;
    }

    if (status.isDenied || status.isRestricted || status.isLimited) {
      final result = await Permission.notification.request();
      if (!result.isGranted) return;
    }

    await scheduleNotification(
      title: 'Stay Hydrated',
      body: "It’s time for your next glass of water.",
      scheduledTime: now.add(const Duration(hours: 1)),
    );
  }

  Future<void> scheduleNotification({
    required String title,
    required String body,
    DateTime? scheduledTime,
    String? payload,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      channelDescription: 'channel_description',
      importance: Importance.max,
      priority: Priority.high,
    );

    await notificationsPlugin.zonedSchedule(
      0,
      title,
      body,
      tz.TZDateTime.from(scheduledTime!, tz.local),
      const NotificationDetails(android: androidDetails),
      payload: payload,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
    );
  }

  Future<void> dailyReminderNotification({
    required String title,
    required String body,
    int? hour,
    String? payload,
  }) async {
    await scheduleNotification(
      title: title,
      body: body,
      scheduledTime: _nextInstanceOfTime(hour: 10),
    );
  }

  Future<void> showNotification({
    required String title,
    required String body,
    String? payload,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      channelDescription: 'channel_description',
      importance: Importance.max,
      priority: Priority.high,
    );

    const details = NotificationDetails(android: androidDetails);

    await notificationsPlugin.show(0, title, body, details, payload: payload);
  }

  tz.TZDateTime _nextInstanceOfTime({required int hour}) {
    final now = tz.TZDateTime.now(tz.local);
    var scheduled =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, 0);
    if (scheduled.isBefore(now)) {
      scheduled = scheduled.add(const Duration(days: 1));
    }
    return scheduled;
  }

  Future<void> cancelAll() async {
    await notificationsPlugin.cancelAll();
  }
}
