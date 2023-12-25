import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/input_fields/GenericTextField.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/widgets/DefaultButton.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/user/screens/settings/widgets/settings_widgets_imports.dart';
import 'package:expenses/user/screens/wallet/data/model/wallet_model.dart';
import 'package:expenses/user/screens/wallet/wallet_imports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BalanceWithdrawal extends StatefulWidget {
  final WalletModel model;
  const BalanceWithdrawal({super.key, required this.model});

  @override
  State<BalanceWithdrawal> createState() => _BalanceWithdrawalState();
}

class _BalanceWithdrawalState extends State<BalanceWithdrawal> {
  TextEditingController controller = TextEditingController();
  bool repeatSwitchValue = false;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedtTime = TimeOfDay.now();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  WalletData data = WalletData();
  double parsedNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(
          title: tr(context, 'withdrawbalance'),
          color: MyColors.white,
          size: 16.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(18.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20.h),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                        title: "المبلغ المطلوب سحبه",
                        color: MyColors.black,
                        size: 14.sp),
                    SizedBox(
                      height: 10.h,
                    ),
                    GenericTextField(
                      controller: controller,
                      fieldTypes: FieldTypes.normal,
                      type: TextInputType.number,
                      action: TextInputAction.next,
                      validate: (text) {
                        if (text == null || text.isEmpty) {
                          return "رجاء ادخال اسم المحفظة";
                        }
                        return null;
                      },
                      onChange: (value) {
                        parsedNumber = double.parse(controller.text);
                      },
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(
                            title: "المبلغ الحالي",
                            color: MyColors.black,
                            size: 16.sp),
                        MyText(
                            title: "${widget.model.balance}",
                            color: MyColors.primary,
                            size: 16.sp)
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(
                            title: "المبلغ المتبقي",
                            color: MyColors.black,
                            size: 16.sp),
                        MyText(
                            title: "${widget.model.balance}",
                            color: MyColors.primary,
                            size: 16.sp)
                      ],
                    ),
                    SizedBox(
                      height: 25.h,
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
                              style: TextStyle(fontSize: 14.sp),
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
                              style: TextStyle(fontSize: 14.sp),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: MyText(
                              title: "التكرار",
                              color: MyColors.black,
                              size: 14.sp),
                        ),
                        Visibility(
                          visible: repeatSwitchValue,
                          child: SizedBox(
                            width: 150.w,
                            child: TileDropdownButton(
                                menuList: data.repeatWallet,
                                value: data.repeatWallet.first,
                                onChanged: (value) {}),
                          ),
                        ),
                        CupertinoSwitch(
                          value: repeatSwitchValue,
                          onChanged: (value) {
                            setState(() {
                              repeatSwitchValue = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          DefaultButton(
            fontSize: 12.sp,
            onTap: () {
              double result = widget.model.balance - parsedNumber;
              widget.model.balance = result;
              widget.model.save();
              AutoRouter.of(context).pop();
            },
            borderColor: MyColors.primary,
            title: "سحب رصيد",
            color: MyColors.primary,
          ),
        ],
      ),
    );
  }

  void chosenTime() async {
    var chosenDate = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (chosenDate != null) {
      selectedtTime = chosenDate;
      timeController.text = selectedtTime.toString();
      setState(() {});
    }
  }

  void chosenDate() async {
    var chosenDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)));

    if (chosenDate != null) {
      selectedDate = chosenDate;
      dateController.text = selectedDate.toString();
      setState(() {});
    }
  }
}
