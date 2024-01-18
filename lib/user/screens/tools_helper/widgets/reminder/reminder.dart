
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/input_fields/GenericTextField.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
    Noti.initialize(flutterLocalNotificationsPlugin);
    selectedDateTime = DateTime.now();
  }

  Future<void> _scheduleNotification() async {
    if (_formKey.currentState?.validate() ?? false) {
      final scheduledDate = selectedDateTime;

      await Noti.scheduleNotification(
        id: 0,
        title: titleController.text,
        body: bodyController.text,
        scheduledDate: scheduledDate,
        fln: flutterLocalNotificationsPlugin,
      );

      Fluttertoast.showToast(
        msg: "${tr(context, "reminderSet")}  : ${_formatDate(selectedDateTime)}",
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
        centerTitle: true,
        title: MyText(title: tr(context, "setReminder"), color: MyColors.white, size: 16.sp,fontWeight: FontWeight.bold,),
      ),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => _selectDateTime(context),
                child: MyText(title: tr(context, "selectedDateTime"), color: Colors.black, size: 20,fontWeight: FontWeight.bold,),
              ),
              GenericTextField(
                  fieldTypes: FieldTypes.normal,
                  type: TextInputType.name,
                  action: TextInputAction.next,
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return tr(context, "fillField");
                    }
                    return null;
                  },
                controller: titleController,
                hint: tr(context, "enterTitle"),
              ),
              GenericTextField(
                  fieldTypes: FieldTypes.normal,
                  type: TextInputType.name,
                  action: TextInputAction.next,
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return tr(context, "fillField");
                    }
                    return null;
                  },
                controller: bodyController,
                hint: tr(context, "enterBody"),
              ),
              ElevatedButton(
                onPressed: () => _scheduleNotification(),
                child: MyText(title: tr(context, "setReminder"), color: Colors.black, size: 20,fontWeight: FontWeight.bold,),
              ),
              Text(
                "التاريخ المحدد: ${_formatDate(selectedDateTime)}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
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
    var iOSInitialize = new IOSInitializationSettings();
    var initializationsSettings = new InitializationSettings(
        android: androidInitialize, iOS: iOSInitialize);
    await flutterLocalNotificationsPlugin.initialize(initializationsSettings);
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
      playSound: true,
      importance: Importance.max,
      priority: Priority.high,
    );

    var not = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: IOSNotificationDetails(),
    );
    await fln.schedule(
      id,
      title,
      body,
      scheduledDate,
      not,
      androidAllowWhileIdle: true,
    );
  }
}
