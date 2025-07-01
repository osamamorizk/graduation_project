import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationRepository {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  /// Call this during app startup
  Future<void> initAndRequestPermissions() async {
    await initialize();
    await requestPermissions();
  }

  Future<void> initialize() async {
    const androidInit = AndroidInitializationSettings('@mipmap/launcher_icon');
    const iosInit = DarwinInitializationSettings();
    const initSettings = InitializationSettings(
      android: androidInit,
      iOS: iosInit,
    );

    await notificationsPlugin.initialize(
      initSettings,
    );
  }

  Future<void> requestPermissions() async {
    // Android-specific permissions
    final androidImplementation =
        notificationsPlugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
    // await androidImplementation?.requestExactAlarmsPermission();
    await androidImplementation?.requestNotificationsPermission();

    // iOS-specific permissions
    final iosImplementation =
        notificationsPlugin.resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>();
    await iosImplementation?.requestPermissions(
        alert: true, badge: true, sound: true);

    // // Ignore battery optimizations (Android)
    // if (await Permission.ignoreBatteryOptimizations.isDenied ||
    //     await Permission.ignoreBatteryOptimizations.isRestricted ||
    //     await Permission.ignoreBatteryOptimizations.isLimited) {
    //   await Permission.ignoreBatteryOptimizations.request();
    // }
  }

  /// Call this anywhere to schedule the next reminder
  Future<void> scheduleDrinkReminder(DateTime now, BuildContext context) async {
    final status = await Permission.notification.status;

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
    required DateTime scheduledTime,
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

    await notificationsPlugin.zonedSchedule(
      0,
      title,
      body,
      tz.TZDateTime.from(scheduledTime, tz.local),
      details,
      payload: payload,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
    );
  }

  /// For daily reminders at fixed hour (e.g., every day at 10am)
  Future<void> dailyReminderNotification({
    required String title,
    required String body,
    int hour = 10,
    String? payload,
  }) async {
    final scheduledTime = _nextInstanceOfTime(hour: hour);
    await scheduleNotification(
      title: title,
      body: body,
      scheduledTime: scheduledTime,
      payload: payload,
    );
  }

  /// Show immediate notification
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
    var scheduled = tz.TZDateTime(tz.local, now.year, now.month, now.day, hour);
    if (scheduled.isBefore(now)) {
      scheduled = scheduled.add(const Duration(days: 1));
    }
    return scheduled;
  }

  Future<void> cancelAll() async {
    await notificationsPlugin.cancelAll();
  }
}
