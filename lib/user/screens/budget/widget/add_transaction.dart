import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/widgets/DefaultButton.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/user/screens/budget/widget/transaction_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedtTime = TimeOfDay.now();

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const TransctionHeader(),
            SizedBox(
              height: 12.h,
            ),
            const Divider(),
            SizedBox(
              height: 10.h,
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: Text(
                    'Select Item',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: items
                      .map((String item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  value: selectedValue,
                  onChanged: (String? value) {
                    setState(() {
                      selectedValue = value;
                    });
                  }),
            ),
            SizedBox(
              height: 10.h,
            ),
            const Divider(),
            DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: Text(
                    'Select Item',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: items
                      .map((String item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  value: selectedValue,
                  onChanged: (String? value) {
                    setState(() {
                      selectedValue = value;
                    });
                  }),
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.menu_open_outlined, size: 40),
                SizedBox(
                  width: 20.w,
                ),
                SizedBox(
                  width: 270.w,
                  child: TextField(
                    textAlign: TextAlign.right,
                    cursorColor: MyColors.primary,
                    decoration: InputDecoration(
                        hintText: "الملاحظات", focusColor: MyColors.primary),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            const Divider(),
            Row(
              children: [
                const Icon(Icons.calendar_month),
                SizedBox(
                  width: 5.w,
                ),
                MyText(
                    title: "تاريخ المعاملة",
                    color: MyColors.black,
                    size: 14.sp),
                SizedBox(
                  width: 10.w,
                ),
                InkWell(
                    onTap: () {
                      chosenDate();
                    },
                    child: Text(
                      '${selectedDate.month}/${selectedDate.day}/${selectedDate.year}',
                      style: TextStyle(fontSize: 16.sp),
                    )),
                SizedBox(
                  width: 60.w,
                ),
                InkWell(
                    onTap: () {
                      chosenTime();
                    },
                    child: Text(
                      ' ${selectedtTime.minute}: ${selectedtTime.hour} ',
                      style: TextStyle(fontSize: 16.sp),
                    )),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            const Divider(),
            SizedBox(height: 50.h),
            DefaultButton(
              onTap: () {},
              borderColor: MyColors.primary,
              title: "اصافة معاملة",
              color: MyColors.primary,
            )
          ],
        ),
      ),
    );
  }

  void chosenDate() async {
    var chosenDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)));
    if (chosenDate != null) {
      selectedDate = chosenDate;
      setState(() {});
    }
  }

  void chosenTime() async {
    var chosenDate = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (chosenDate != null) {
      selectedtTime = chosenDate;
      setState(() {});
    }
  }
}

final List<String> items = [
  'مصروف شهري',
  'حساب بنكي',
  'Item3',
  'Item4',
];
