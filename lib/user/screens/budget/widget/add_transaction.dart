import 'package:auto_route/auto_route.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/widgets/DefaultButton.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddTransactionBudget extends StatefulWidget {
  const AddTransactionBudget({super.key});

  @override
  State<AddTransactionBudget> createState() => _AddTransactionBudgetState();
}

class _AddTransactionBudgetState extends State<AddTransactionBudget> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedtTime = TimeOfDay.now();
  var formKey = GlobalKey<FormState>();

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.primary,
          elevation: 0,
          leading: IconButton(
            onPressed: () => AutoRouter.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios),
            color: MyColors.white,
          ),
          centerTitle: true,
          title: MyText(
            title: "الميزانية والخطط المالية",
            color: MyColors.white,
            size: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(12.w),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 45.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                            color: MyColors.white,
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(color: MyColors.primary)),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "ج.م",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      SizedBox(
                        width: 270.w,
                        child: TextFormField(
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return "please enter the value";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.right,
                          cursorColor: MyColors.primary,
                          decoration: InputDecoration(
                              suffixIcon: Image.asset(
                                "assets/images/calculator.png",
                              ),
                              hintText: "المبلغ",
                              hintStyle: TextStyle(
                                  fontSize: 18.sp, color: MyColors.grey),
                              focusColor: MyColors.primary),
                        ),
                      ),
                    ],
                  ),
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
                        child: TextFormField(
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return "please enter the value";
                            }
                            return null;
                          },
                          textAlign: TextAlign.right,
                          cursorColor: MyColors.primary,
                          decoration: InputDecoration(
                              hintText: "الملاحظات",
                              focusColor: MyColors.primary),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
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
                    onTap: () {
                      validation();
                    },
                    borderColor: MyColors.primary,
                    title: "اصافة معاملة",
                    color: MyColors.primary,
                  )
                ],
              ),
            ),
          ),
        ));
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

  void validation() {
    if (formKey.currentState?.validate() == true) {
      Navigator.pop(context);
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
