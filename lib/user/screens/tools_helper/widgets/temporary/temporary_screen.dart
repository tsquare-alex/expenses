import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/widgets/DefaultButton.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class TemporaryScreen extends StatefulWidget {
  const TemporaryScreen({super.key});

  @override
  _TemporaryScreenState createState() => _TemporaryScreenState();
}

class _TemporaryScreenState extends State<TemporaryScreen> {
  late TimeOfDay _selectedTime;
  bool _isRunning = false;
  late CountDownController _controller;
  late int _totalSeconds;
  int _lastNotificationId = 0; // Track the last used notificationId
  // void scheduleDailyNotification() async {
  //   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  //   FlutterLocalNotificationsPlugin();
  //
  //   const AndroidNotificationDetails androidPlatformChannelSpecifics =
  //   AndroidNotificationDetails(
  //     'your_channel_id', // replace with your channel ID
  //     'Your Channel Name', // replace with your channel name
  //     importance: Importance.max,
  //     priority: Priority.high,
  //   );
  //
  //   const NotificationDetails platformChannelSpecifics =
  //   NotificationDetails(android: androidPlatformChannelSpecifics);
  //
  //   // Schedule the notification to be shown every 10 minutes
  //   await flutterLocalNotificationsPlugin.periodicallyShow(
  //     0,
  //     'Your Notification Title',
  //     'Your Notification Body',
  //     RepeatInterval.everyMinute,
  //     platformChannelSpecifics,
  //   );
  // }

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
      endTime = endTime.add(const Duration(days: 1));
    }

    _totalSeconds = endTime.difference(now).inSeconds;

    // Cancel any existing scheduled notifications
    if (_lastNotificationId > 0) {
      LocalNotifications.cancelNotification(_lastNotificationId);
    }

    _lastNotificationId++;
    LocalNotifications.temporaryNotification(
      context: context,
      notificationId: _lastNotificationId,
      title: "",
      body: "",
      scheduledDate: DateTime.now().add(Duration(seconds: _totalSeconds)),
    );

    // Check if the controller is not null before calling restart
    _controller.restart(duration: _totalSeconds);

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
        title: MyText(
          title: tr(context, "temporary"),
          color: Colors.white,
          size: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //selectTime
            DefaultButton(
              onTap: () => _selectDateTime(context),
              title: tr(context, "selectTime"),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),

            const SizedBox(height: 20),
            MyText(
              title:
                  '${tr(context, "selectedDate")}: ${_selectedTime.format(context)}',
              color: MyColors.black,
              size: 20,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 20),
            _isRunning
                ? CircularCountDownTimer(
                    duration: _totalSeconds,
                    controller: _controller,
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.width / 2,
                    fillColor: Colors.white,
                    strokeWidth: 10.0,
                    strokeCap: StrokeCap.round,
                    textStyle: const TextStyle(
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
                : const SizedBox(),
            DefaultButton(
              onTap: _isRunning ? _stopTimer : () => _startTimer(),
              title: _isRunning
                  ? " ${tr(context, "stopTimer")}"
                  : tr(context, "startTimer"),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
