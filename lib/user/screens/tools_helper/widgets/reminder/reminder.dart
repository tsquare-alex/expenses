import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/widgets/DefaultButton.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../../../../../general/constants/MyColors.dart';
import '../../../../../general/themes/app_colors.dart';
import '../../../../../general/themes/cubit/app_theme_cubit.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

class ReminderScreen extends StatefulWidget {
  @override
  _ReminderScreenState createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  late DateTime selectedDateTime;
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    LocalNotifications.init();
    selectedDateTime = DateTime.now();
  }

  Future<void> _scheduleNotification() async {
    if (_formKey.currentState?.validate() ?? false) {
      final scheduledDate = selectedDateTime;

      await LocalNotifications.showScheduleNotification(
        notificationId: 0,
        title: titleController.text,
        body: bodyController.text,
        scheduledDate: scheduledDate,
      );

      Fluttertoast.showToast(
        msg: "Reminder set: ${_formatDate(selectedDateTime)}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0,
      );

      setState(() {
        titleController.clear();
        bodyController.clear();
      });
    }
  }

  String _formatDate(DateTime dateTime) {
    return "${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}";
  }

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDateTime = await showDatePicker(
      context: context,
      initialDate: selectedDateTime,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (pickedDateTime != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(selectedDateTime),
      );

      if (pickedTime != null) {
        setState(() {
          selectedDateTime = DateTime(
            pickedDateTime.year,
            pickedDateTime.month,
            pickedDateTime.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
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
        title: MyText(title: tr(context, "setReminder"),  color:context.watch<AppThemeCubit>().isDarkMode
            ? MyColors.white
            :MyColors.black,
          size: 20,fontWeight: FontWeight.bold,),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DefaultButton(
                color:  context.watch<AppThemeCubit>().isDarkMode
                    ? AppDarkColors.primary
                    : MyColors.primary,

                title: tr(context, "selectedDateTime"),onTap: ()=> _selectDateTime(context),fontSize: 20,fontWeight: FontWeight.bold,),
              // ElevatedButton(
              //   onPressed: () => _selectDateTime(context),
              //   child: MyText(title: tr(context, "selectedDateTime"), color: Colors.white, size: 18,fontWeight: FontWeight.bold,)),
              TextFormField(
                controller: titleController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return tr(context, "enterTitle");
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: tr(context, "enterTitle")),
              ),
              TextFormField(
                controller: bodyController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return tr(context, "enterBody");
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: tr(context, "enterBody")),
              ),
              DefaultButton(

                color:  context.watch<AppThemeCubit>().isDarkMode
                    ? AppDarkColors.primary
                    : MyColors.primary,

                title: tr(context, "setReminder"),onTap: ()=> _scheduleNotification(),fontSize: 20,fontWeight: FontWeight.bold,),

              Text(
                "${tr(context, "selectedDate")} ${_formatDate(selectedDateTime)}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// class LocalNotifications {
//   static final FlutterLocalNotificationsPlugin
//   _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//   static final onClickNotification = BehaviorSubject<String>();
//
//   static void onNotificationTap(NotificationResponse notificationResponse) {
//     onClickNotification.add(notificationResponse.payload!);
//   }
//
//   static Future init() async {
//     const AndroidInitializationSettings initializationSettingsAndroid =
//     AndroidInitializationSettings('@mipmap/ic_launcher');
//     final DarwinInitializationSettings initializationSettingsDarwin =
//     DarwinInitializationSettings(
//       onDidReceiveLocalNotification: (id, title, body, payload) => null,
//     );
//     final LinuxInitializationSettings initializationSettingsLinux =
//     LinuxInitializationSettings(defaultActionName: 'Open notification');
//     final InitializationSettings initializationSettings =
//     InitializationSettings(
//         android: initializationSettingsAndroid,
//         iOS: initializationSettingsDarwin,
//         linux: initializationSettingsLinux);
//     _flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onDidReceiveNotificationResponse: onNotificationTap,
//         onDidReceiveBackgroundNotificationResponse: onNotificationTap);
//   }
//
//
//   static Future showScheduleNotification({
//     required int notificationId, // Unique notification ID
//     required String title,
//     required String body,
//     // required String payload,
//     required DateTime scheduledDate,
//   }) async {
//     tz.initializeTimeZones();
//     final tz.TZDateTime notificationTime =
//     tz.TZDateTime.from(scheduledDate, tz.local);
//
//     if (notificationTime.isBefore(tz.TZDateTime.now(tz.local))) {
//       throw ArgumentError("Scheduled date must be in the future.");
//     }
//
//     await _flutterLocalNotificationsPlugin.zonedSchedule(
//       notificationId, // Use the unique notification ID
//       title,
//       body,
//       notificationTime,
//       const NotificationDetails(
//         android: AndroidNotificationDetails(
//           'channel 3',
//           'your channel name',
//           channelDescription: 'your channel description',
//           importance: Importance.max,
//           priority: Priority.high,
//           ticker: 'ticker',
//         ),
//       ),
//       androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
//       uiLocalNotificationDateInterpretation:
//       UILocalNotificationDateInterpretation.absoluteTime,
//       // payload: payload,
//     );
//   }
//
//
//
//
//
//
// }

