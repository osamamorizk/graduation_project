import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/feature/drink_water/data/repos/notification_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationCubit extends Cubit<bool> {
  final NotificationRepository notificationRepository;

  NotificationCubit(this.notificationRepository) : super(true);

  Future<void> loadNotificationStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final enabled = prefs.getBool('notifications_enabled') ?? true;
    emit(enabled);
  }

  Future<void> toggleNotification(bool isEnabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notifications_enabled', isEnabled);
    emit(isEnabled);
  }

  Future<void> initialize() async {
    await notificationRepository.initialize();
    await dailyReminder(
      'Reminder to Stay Hydrated',
      'It\'s time to drink some water!',
      9,
    );
    await dailyReminder(
      'Time to Get Active!',
      'Your workout session is waiting for you!',
      14,
    );
  }

  Future<void> requestPermissions() async {
    await notificationRepository.requestPermissions();
  }

  Future<void> tryShowNotification(String title, String body) async {
    if (state) {
      await notificationRepository.showNotification(title: title, body: body);
    }
  }

  Future<void> remindToDrink(DateTime now, BuildContext context) async {
    if (state) {
      await notificationRepository.scheduleDrinkReminder(now, context);
    }
  }

  Future<void> dailyReminder(String title, String body, int hour) async {
    if (state) {
      await notificationRepository.dailyReminderNotification(
          title: title, body: body, hour: hour);
    }
  }

  Future<void> scheduleNotification(
    String title,
    String body,
    DateTime dateTime, {
    String? payload,
  }) async {
    if (state) {
      await notificationRepository.scheduleNotification(
        title: title,
        body: body,
        scheduledTime: dateTime,
        payload: payload,
      );
    }
  }

  Future<void> cancelAllNotifications() async {
    await notificationRepository.cancelAll();
  }
}
