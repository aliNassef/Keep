import 'dart:async';
import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static StreamController<NotificationResponse> streamController =
      StreamController();
  static onTap(NotificationResponse notificationResponse) {
    log(notificationResponse.id!.toString());
    log(notificationResponse.payload!.toString());
    streamController.add(notificationResponse);
  }

  Future<void> init() async {
    // Initialize native android notification
    // but app icon from android manfist
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // Initialize native Ios Notifications
    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings();

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveBackgroundNotificationResponse: onTap,
      onDidReceiveNotificationResponse: onTap,
    );
  }

  void showBasicNotiffication() async {
    NotificationDetails details = NotificationDetails(
      android: AndroidNotificationDetails(
        'id 1',
        'basic notification',
        importance: Importance.max,
        priority: Priority.high,
        sound: RawResourceAndroidNotificationSound(
          'notification.wav'.split('.').first,
        ),
      ),
    );
    await flutterLocalNotificationsPlugin.show(
      0,
      'Hi',
      'First Notification',
      details,
      payload: 'DATA',
    );
  }

  void showRepeatedNotiffication() async {
    NotificationDetails details = const NotificationDetails(
      android: AndroidNotificationDetails(
        'id 1',
        'basic notification',
        importance: Importance.max,
        priority: Priority.high,
      ),
    );
    await flutterLocalNotificationsPlugin.periodicallyShow(
      1,
      'Hi',
      'First Notification',
      RepeatInterval.everyMinute,
      details,
    );
  }

  void showScheduleNotiffication() async {
    NotificationDetails details = const NotificationDetails(
      android: AndroidNotificationDetails(
        'id 1',
        'basic notification',
        importance: Importance.max,
        priority: Priority.high,
      ),
    );

    // initial time zone
    tz.initializeTimeZones();
    log(tz.TZDateTime.now(tz.local).toString());
    var scheduleTime = tz.TZDateTime(
      tz.local,
      DateTime.now().year,
      DateTime.may,
      DateTime.now().day,
      21 - 2, // the hour i need -  2
    );
    if (scheduleTime.isBefore(DateTime.now())) {
      scheduleTime = scheduleTime.add(
        const Duration(days: 1),
      );
    }
    // minus 2 hours
    await flutterLocalNotificationsPlugin.zonedSchedule(
      2,
      'Don\'t Forget To Write Your Tasks',
      'Have a Productive Day 🥰',
      scheduleTime,
      details,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  void cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }
}
