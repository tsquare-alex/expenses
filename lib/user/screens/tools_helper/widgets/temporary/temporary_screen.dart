import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/widgets/DefaultButton.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

class TemporaryScreen extends StatefulWidget {
  @override
  _TemporaryScreenState createState() => _TemporaryScreenState();
}

class _TemporaryScreenState extends State<TemporaryScreen> {
  late TimeOfDay _selectedTime;
  bool _isRunning = false;
  late CountDownController _controller;
  late int _totalSeconds;
  int _lastNotificationId = 0; // Track the last used notificationId

  @override
  void initState() {
    super.initState();
    _selectedTime = TimeOfDay.now();
    _controller = CountDownController();
    _totalSeconds = 0;
    LocalNotifications.init();
  }

  void _startTimer() {
    setState(() {
      _isRunning = true;
    });

    DateTime now = DateTime.now();
    DateTime endTime = DateTime(
      now.year,
      now.month,
      now.day,
      _selectedTime.hour,
      _selectedTime.minute,
    );

    if (endTime.isBefore(now)) {
      endTime = endTime.add(Duration(days: 1));
    }

    _totalSeconds = endTime.difference(now).inSeconds;

    // Cancel any existing scheduled notifications
    if (_lastNotificationId > 0) {
      LocalNotifications.cancelNotification(_lastNotificationId);
    }

    // Get the current device language
    final String deviceLanguage = Localizations.localeOf(context).languageCode;

    // Customize notification based on the device language
    String notificationTitle = tr(context, "totalPrice");
    String notificationBody = 'Your timer has ended.';

    if (deviceLanguage == 'es') {
      // Spanish
      notificationTitle = 'Título en español';
      notificationBody = 'Tu temporizador ha terminado.';
    } else if (deviceLanguage == 'fr') {
      // French
      notificationTitle = 'Titre en français';
      notificationBody = 'Votre minuteur est terminé.';
    }
    // Add more language cases as needed

    // Schedule local notification when the timer ends
    _lastNotificationId++;
    LocalNotifications.showScheduleNotification(
      context: context,
      notificationId: _lastNotificationId,
      title: notificationTitle,
      body: notificationBody,
      scheduledDate: DateTime.now().add(Duration(seconds: _totalSeconds)),
    );

    // Check if the controller is not null before calling restart
    if (_controller != null) {
      _controller.restart(duration: _totalSeconds);
    }

    Future.delayed(Duration(seconds: _totalSeconds), () {
      setState(() {
        _isRunning = false;
      });
    });
  }


  void _stopTimer() {
    setState(() {
      _isRunning = false;
      _controller.pause();
    });
  }

  Future<void> _selectDateTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: MyText(title: tr(context, "temporary"), color: Colors.white, size: 20,fontWeight: FontWeight.bold,),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //selectTime
            DefaultButton(
              onTap: () => _selectDateTime(context),
              title: '${tr(context, "selectTime")}',fontSize: 20,fontWeight: FontWeight.bold,),

            SizedBox(height: 20),
            MyText(
             title: '${tr(context, "selectedDate")}: ${_selectedTime.format(context)}',
              color: MyColors.black,
              size: 20,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 20),
            _isRunning
                ? CircularCountDownTimer(
              duration: _totalSeconds,
              controller: _controller,
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.width / 2,
              fillColor: Colors.white,
              strokeWidth: 10.0,
              strokeCap: StrokeCap.round,
              textStyle: TextStyle(
                fontSize: 22.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              isReverse: true,
              onComplete: () {
                // Handle completion if needed
              },
              ringColor: Colors.blue,
            )
                : SizedBox(),
            DefaultButton(
              onTap:  _isRunning ? _stopTimer : () => _startTimer(),
                title: _isRunning ?" ${tr(context, "stopTimer")}" : '${tr(context, "startTimer")}',fontSize: 20,fontWeight: FontWeight.bold,),

          ],
        ),
      ),
    );
  }
}

class LocalNotifications {
  static final FlutterLocalNotificationsPlugin
  _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  static final onClickNotification = BehaviorSubject<String>();

  static void onNotificationTap(
      NotificationResponse notificationResponse) {
    onClickNotification.add(notificationResponse.payload!);
  }

  static Future init() async {
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
      linux: initializationSettingsLinux,
    );
    _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onNotificationTap,
        onDidReceiveBackgroundNotificationResponse: onNotificationTap);
  }

  static Future showScheduleNotification({
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

    // Get the current device language
    final String deviceLanguage = Localizations.localeOf(context).languageCode;

    // Customize notification based on the device language
    String localizedTitle = title;
    String localizedBody = body;

    if (deviceLanguage == 'ar') {
      // Spanish
      localizedTitle = 'تم الانتهاء من الوقت';
      localizedBody = 'انتهى الوقت';
    } else if (deviceLanguage == 'en') {
      // French
      localizedTitle = 'Timer Ended';
      localizedBody = 'Your Time has been end';
    }
    // Add more language cases as needed

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


  static Future<void> cancelNotification(int notificationId) async {
    await _flutterLocalNotificationsPlugin.cancel(notificationId);
  }
}
