import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/widgets/DefaultButton.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/user/screens/settings/widgets/settings_widgets_imports.dart';
import 'package:expenses/user/screens/wallet/data/model/wallet_model.dart';
import 'package:expenses/user/screens/wallet/wallet_imports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditWallet extends StatefulWidget {
  final WalletModel model;
  const EditWallet({super.key, required this.model});

  @override
  State<EditWallet> createState() => _EditWalletState();
}

class _EditWalletState extends State<EditWallet> {
  final TextEditingController walletNameController = TextEditingController();
  final TextEditingController balanceController = TextEditingController();
  final TextEditingController paymentMethodController = TextEditingController();
  final TextEditingController rangeDateController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController encomSourceController = TextEditingController();
  final TextEditingController valueCategoryController = TextEditingController();
  WalletData data = WalletData();
  double parsedNumber = 0;
  bool repeatSwitchValue = false;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedtTime = TimeOfDay.now();
  bool notificationSwitchvalu = false;
  DateTimeRange selectRangeDate =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());

  @override
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          height: 105.h,
          width: double.infinity,
          color: MyColors.primary,
          child: Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              onPressed: () => AutoRouter.of(context).pop(),
              icon: const Icon(Icons.arrow_back_ios),
              color: MyColors.white,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(12.w),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: walletNameController,
                  keyboardType: TextInputType.name,
                  textAlign: TextAlign.right,
                  cursorColor: MyColors.primary,
                  decoration: InputDecoration(
                      hoverColor: MyColors.primary,
                      fillColor: MyColors.primary,
                      hintText: widget.model.name,
                      hintStyle:
                          TextStyle(fontSize: 18.sp, color: MyColors.grey),
                      focusColor: MyColors.primary),
                ),
                SizedBox(height: 40.h),
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
                      width: 10.w,
                    ),
                    SizedBox(
                      width: 270.w,
                      child: TextFormField(
                        onChanged: (value) {
                          parsedNumber = double.parse(balanceController.text);
                        },
                        controller: balanceController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.right,
                        cursorColor: MyColors.primary,
                        decoration: InputDecoration(
                            hintText: widget.model.balance.toString(),
                            hintStyle: TextStyle(
                                fontSize: 18.sp, color: MyColors.grey),
                            focusColor: MyColors.primary),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  children: [
                    MyText(
                        title: "طريقة الدفع",
                        color: MyColors.black,
                        size: 16.sp),
                    SizedBox(
                      width: 50.w,
                    ),
                    SizedBox(
                      width: 150.w,
                      child: TileDropdownButton(
                        menuList: data.paymentMethod,
                        value: data.paymentMethod.first,
                        onChanged: (value) => {
                          paymentMethodController.text = value as String,
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                        title: "التصنيف", color: MyColors.black, size: 14.sp),
                    SizedBox(
                      width: 150.w,
                      child: TileDropdownButton(
                          menuList: data.walletCategory,
                          value: data.walletCategory.first,
                          onChanged: (value) {
                            categoryController.text = value as String;
                          }),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                        title: "مصدر الدخل",
                        color: MyColors.black,
                        size: 14.sp),
                    SizedBox(
                      width: 150.w,
                      child: TileDropdownButton(
                          menuList: data.encomeSource,
                          value: data.encomeSource.first,
                          onChanged: (value) {
                            encomSourceController.text = value as String;
                          }),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                        title: "تحديد نوع القيمة",
                        color: MyColors.black,
                        size: 14.sp),
                    SizedBox(
                      width: 150.w,
                      child: TileDropdownButton(
                          menuList: data.valueCategory,
                          value: data.valueCategory.first,
                          onChanged: (value) {
                            valueCategoryController.text = value as String;
                          }),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                        title: "تكرار المحفظة",
                        color: MyColors.black,
                        size: 14.sp),
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
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                        title: "تنبيه انتهاء المعالمة",
                        color: MyColors.black,
                        size: 14.sp),
                    Visibility(
                      visible: notificationSwitchvalu,
                      child: SizedBox(
                        width: 150.w,
                        child: Container(),
                      ),
                    ),
                    CupertinoSwitch(
                      value: notificationSwitchvalu,
                      onChanged: (value) {
                        setState(() {
                          notificationSwitchvalu = value;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                        title: "مدة المحفظة",
                        color: MyColors.black,
                        size: 14.sp),
                    SizedBox(
                      width: 10.w,
                    ),
                    IconButton(
                      onPressed: () {
                        dateRange();
                      },
                      icon: const Icon(Icons.calendar_month_outlined),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                DefaultButton(
                  fontSize: 12.sp,
                  onTap: () {
                    widget.model.paymentMethod = paymentMethodController.text;
                    widget.model.balance = parsedNumber;
                    widget.model.name = walletNameController.text;
                    widget.model.save();
                    AutoRouter.of(context).pop();
                  },
                  borderColor: MyColors.primary,
                  title: "تعديل",
                  color: MyColors.primary,
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  void dateRange() async {
    var dateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(3000),
    );
    if (dateRange != null) {
      setState(() {
        selectRangeDate = dateRange;
        rangeDateController.text = selectRangeDate.toString();
      });
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
}
