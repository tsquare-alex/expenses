import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/widgets/DefaultButton.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

import '../../../../../general/themes/app_colors.dart';
import '../../../../../general/themes/cubit/app_theme_cubit.dart';

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
      endTime = endTime.add(Duration(days: 1));
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
        leading: GestureDetector(
          onTap: () => AutoRouter.of(context).pop(),
          child: Icon(
            Icons.arrow_back,
            color: context.watch<AppThemeCubit>().isDarkMode
                ? MyColors.white
                : MyColors.black,
          ),
        ),
        backgroundColor: context.watch<AppThemeCubit>().isDarkMode
            ? AppDarkColors.backgroundColor
            :MyColors.white,
        centerTitle: true,
        title: MyText(title: tr(context, "temporary"),  color:context.watch<AppThemeCubit>().isDarkMode
            ? MyColors.white
            :MyColors.black, size: 20,fontWeight: FontWeight.bold,),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //selectTime
            DefaultButton(
              color:  context.watch<AppThemeCubit>().isDarkMode
                  ? AppDarkColors.primary
                  : MyColors.primary,

              onTap: () => _selectDateTime(context),
              title: '${tr(context, "selectTime")}',fontSize: 20,fontWeight: FontWeight.bold,),

            SizedBox(height: 20),
            MyText(
             title: '${tr(context, "selectedDate")}: ${_selectedTime.format(context)}',
              color:context.watch<AppThemeCubit>().isDarkMode
                  ? MyColors.white
                  :MyColors.black,
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
                color:context.watch<AppThemeCubit>().isDarkMode
                    ? MyColors.white
                    :MyColors.black,
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
              color:  context.watch<AppThemeCubit>().isDarkMode
                  ? AppDarkColors.primary
                  : MyColors.primary,

              onTap:  _isRunning ? _stopTimer : () => _startTimer(),
                title: _isRunning ?" ${tr(context, "stopTimer")}" : '${tr(context, "startTimer")}',fontSize: 20,fontWeight: FontWeight.bold,),

          ],
        ),
      ),
    );
  }
}


