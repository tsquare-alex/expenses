import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotifications {
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  static final onClickNotification = BehaviorSubject<String>();

  static void onNotificationTap(NotificationResponse notificationResponse) {
    onClickNotification.add(notificationResponse.payload!);
  }

  static Future init() async {
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      onDidReceiveLocalNotification: (id, title, body, payload) => null,
    );
    final LinuxInitializationSettings initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: 'Open notification');
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin,
            linux: initializationSettingsLinux);
    _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onNotificationTap,
        onDidReceiveBackgroundNotificationResponse: onNotificationTap);
  }




  static Future showScheduleNotification({
    required int notificationId, // Unique notification ID
    required String title,
    required String body,
    // required String payload,
    required DateTime scheduledDate,
  }) async {
    tz.initializeTimeZones();
    final tz.TZDateTime notificationTime =
    tz.TZDateTime.from(scheduledDate, tz.local);

    if (notificationTime.isBefore(tz.TZDateTime.now(tz.local))) {
      throw ArgumentError("Scheduled date must be in the future.");
    }

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      notificationId, // Use the unique notification ID
      title,
      body,
      notificationTime,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'channel 3',
          'your channel name',
          channelDescription: 'your channel description',
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker',
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      // payload: payload,
    );
  }

  static Future cancel(int id) async {
    await _flutterLocalNotificationsPlugin.cancel(id);
  }

  // close all the notifications available
  static Future cancelAll() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }

  static Future showScheduleNotification9({
    required int notificationId, // Unique notification ID
    required String title,
    required String body,
    // required String payload,
  }) async {
    tz.initializeTimeZones();

    final tz.TZDateTime notificationTime = tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5));

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      notificationId, // Use the unique notification ID
      title,
      body,
      notificationTime,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'channel 3',
          'your channel name',
          channelDescription: 'your channel description',
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker',
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      // payload: payload,
    );
  }

  static String getDeviceLanguage() {
    return WidgetsBinding.instance?.window.locale.languageCode ?? 'en';
  }


  static Future temporaryNotification({
    required int notificationId,
    required String title,
    required String body,
    required DateTime scheduledDate,
    required BuildContext context,
  }) async {
    tz.initializeTimeZones();
    final tz.TZDateTime notificationTime =
    tz.TZDateTime.from(scheduledDate, tz.local);

    if (notificationTime.isBefore(tz.TZDateTime.now(tz.local))) {
      throw ArgumentError("Scheduled date must be in the future.");
    }

    final String deviceLanguage = Localizations.localeOf(context).languageCode;

    String localizedTitle = title;
    String localizedBody = body;

    if (deviceLanguage == 'ar') {
      localizedTitle = 'تم الانتهاء من الوقت';
      localizedBody = 'انتهى الوقت';
    } else if (deviceLanguage == 'en') {
      localizedTitle = 'Timer Ended';
      localizedBody = 'Your Time has been end';
    }

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      notificationId,
      localizedTitle,
      localizedBody,
      notificationTime,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'channel 3',
          'your channel name',
          channelDescription: 'your channel description',
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker',
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
  static Future scheduleDailyNotification({
    required String title,
    required String body,
  }) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'your_channel_id',
      'Your Channel Name',
      importance: Importance.max,
      priority: Priority.high,
    );

    final String deviceLanguage = getDeviceLanguage();

    String localizedTitle = title;
    String localizedBody = body;

    if (deviceLanguage == 'ar') {
      localizedTitle = 'افتح التطبيق الآن';
      localizedBody = 'استمتع بجميع مميزات التطبيق';
    } else if (deviceLanguage == 'en') {
      localizedTitle = 'Open the application now';
      localizedBody = 'Enjoy all the features of the application';
    }
    final NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    await _flutterLocalNotificationsPlugin.periodicallyShow(
      0,
      localizedTitle,
      localizedBody,
      RepeatInterval.hourly,
      platformChannelSpecifics,
    );
  }




  static Future<void> cancelNotification(int notificationId) async {
    await _flutterLocalNotificationsPlugin.cancel(notificationId);
  }

}
