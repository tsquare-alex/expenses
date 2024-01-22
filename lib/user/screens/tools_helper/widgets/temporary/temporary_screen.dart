// final  audioPlayer = AudioPlayer();
//
// Future<void> playSound() async {
//   String soundPath = "sounds/notification.mp3";
//   await audioPlayer.play(AssetSource(soundPath));
// }
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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

  @override
  void initState() {
    super.initState();
    _selectedTime = TimeOfDay.now();
    _controller = CountDownController();
    _totalSeconds = 0;
    Noti.initialize(flutterLocalNotificationsPlugin);
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
      // If the selected time is before the current time, set it for the next day
      endTime = endTime.add(Duration(days: 1));
    }

    _totalSeconds = endTime.difference(now).inSeconds;

    _controller.restart(duration: _totalSeconds);

    // Schedule local notification when the timer ends
    Future.delayed(Duration(seconds: _totalSeconds), () {
      Noti.scheduleNotification(
        id: 0,
        title: 'Timer Ended',
        body: 'Your timer has ended.',
        scheduledDate: DateTime.now(),
        fln: flutterLocalNotificationsPlugin,
      );

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
        title: Text('Temporary Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _selectDateTime(context),
              child: Text('Select Time'),
            ),
            SizedBox(height: 20),
            Text(
              'Selected Time: ${_selectedTime.format(context)}',
              style: TextStyle(fontSize: 18),
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
            ElevatedButton(
              onPressed: _isRunning ? _stopTimer : () => _startTimer(),
              child: Text(_isRunning ? 'Stop Timer' : 'Start Timer'),
            ),
          ],
        ),
      ),
    );
  }
}

class Noti {
  static Future initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInitialize =
    new AndroidInitializationSettings('mipmap/ic_launcher');
    // var iOSInitialize = new IOSInitializationSettings();
    // var initializationsSettings = new InitializationSettings(
    //     android: androidInitialize, iOS: iOSInitialize);
    // await flutterLocalNotificationsPlugin.initialize(initializationsSettings);
  }

  static Future scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDate,
    required FlutterLocalNotificationsPlugin fln,
  }) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'you_can_name_it_whatever1',
      'channel_name',
      playSound: false, // Set playSound to false
      importance: Importance.max,
      priority: Priority.high,
    );

    var not = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      // iOS: IOSNotificationDetails(),
    );
    // await fln.schedule(
    //   id,
    //   title,
    //   body,
    //   scheduledDate,
    //   not,
    //   androidAllowWhileIdle: true,
    // );
  }
}

//
// import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:circular_countdown_timer/circular_countdown_timer.dart';
// import 'package:flutter/material.dart';
//
// class TemporaryScreen extends StatefulWidget {
//   @override
//   _TemporaryScreenState createState() => _TemporaryScreenState();
// }
//
// class _TemporaryScreenState extends State<TemporaryScreen> {
//   final AudioPlayer audioPlayer = AudioPlayer();
//   late TimeOfDay _selectedTime;
//   bool _isRunning = false;
//   late CountDownController _controller;
//   late int _totalSeconds;
//
//   @override
//   void initState() {
//     super.initState();
//     _selectedTime = TimeOfDay.now();
//     _controller = CountDownController();
//     _totalSeconds = 0;
//   }
//
//   Future<void> playSound() async {
//     String soundPath = "sounds/notification.mp3";
//     await audioPlayer.play(AssetSource(soundPath));
//   }
//   void _startTimer() async {
//     setState(() {
//       _isRunning = true;
//     });
//
//     DateTime now = DateTime.now();
//     DateTime endTime = DateTime(
//       now.year,
//       now.month,
//       now.day,
//       _selectedTime.hour,
//       _selectedTime.minute,
//     );
//
//     if (endTime.isBefore(now)) {
//       // If the selected time is before the current time, set it for the next day
//       endTime = endTime.add(Duration(days: 1));
//     }
//
//     _totalSeconds = endTime.difference(now).inSeconds;
//
//     _controller.restart(duration: _totalSeconds);
//
//     // Set up the alarm to trigger the timer
//     await AndroidAlarmManager.oneShot(
//       Duration(seconds: _totalSeconds),
//       0, // ID for the alarm
//       _onTimerEnd,
//       exact: true,
//       wakeup: true, // Set wakeup to true
//     );
//   }
//
//   void _onTimerEnd() {
//     if (mounted) {
//       playSound();
//       setState(() {
//         _isRunning = false;
//       });
//     }
//   }
//
//   void _stopTimer() {
//     AndroidAlarmManager.cancel(0); // Cancel the scheduled alarm
//     setState(() {
//       _isRunning = false;
//     });
//   }
//
//   Future<void> _selectDateTime(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime.now(),
//       lastDate: DateTime.now().add(Duration(days: 365)),
//     );
//
//     if (picked != null) {
//       final TimeOfDay? time = await showTimePicker(
//         context: context,
//         initialTime: TimeOfDay.now(),
//       );
//
//       if (time != null) {
//         setState(() {
//           _selectedTime = TimeOfDay(hour: time.hour, minute: time.minute);
//         });
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Temporary Screen'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () => _selectDateTime(context),
//               child: Text('Select Date and Time'),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Selected Time: ${_selectedTime.format(context)}',
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 20),
//             _isRunning
//                 ? CircularCountDownTimer(
//               duration: _totalSeconds,
//               controller: _controller,
//               width: MediaQuery.of(context).size.width / 2,
//               height: MediaQuery.of(context).size.width / 2,
//               fillColor: Colors.white,
//               strokeWidth: 10.0,
//               strokeCap: StrokeCap.round,
//               textStyle: TextStyle(
//                 fontSize: 22.0,
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//               ),
//               isReverse: true,
//               onComplete: () {
//                 _onTimerEnd();
//               },
//               ringColor: Colors.blue,
//             )
//                 : SizedBox(),
//             ElevatedButton(
//               onPressed: _isRunning ? _stopTimer : () => _startTimer(),
//               child: Text(_isRunning ? 'Stop Timer' : 'Start Timer'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
