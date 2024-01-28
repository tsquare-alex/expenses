import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../../general/constants/MyColors.dart';
import '../../../../../general/themes/app_colors.dart';
import '../../../../../general/themes/cubit/app_theme_cubit.dart';

class CalenderScreen extends StatefulWidget {
  @override
  _CalenderScreenState createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2010, 10, 16),
      lastDate: DateTime(2030, 3, 14),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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

        title: MyText(
          title: tr(context, "calender"),
          color:context.watch<AppThemeCubit>().isDarkMode
              ? MyColors.white
              :MyColors.black,
          size: 20.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyText(
              title: "${tr(context, "currentDate")} : ${DateFormat.yMMMMd().format(DateTime.now())}",
              color:context.watch<AppThemeCubit>().isDarkMode
                  ? MyColors.white
                  :MyColors.black100,
              size: 20.sp,
              fontWeight: FontWeight.bold,
            ),
            // SizedBox(height: 16.0),
            // MyText(
            //   title: "Selected Date: ${DateFormat.yMMMMd().format(_selectedDate)}",
            //   color: Colors.black,
            //   size: 20.sp,
            //   fontWeight: FontWeight.bold,
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _selectDate(context),
        child: Icon(Icons.calendar_today),
      ),
    );
  }
}
