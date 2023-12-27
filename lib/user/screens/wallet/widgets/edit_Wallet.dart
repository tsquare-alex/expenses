import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/widgets/DefaultButton.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/user/screens/settings/widgets/settings_widgets_imports.dart';
import 'package:expenses/user/screens/wallet/data/cubit/wallet_cubit/wallet_cubit.dart';
import 'package:expenses/user/screens/wallet/data/model/wallet_model.dart';
import 'package:expenses/user/screens/wallet/wallet_imports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final TextEditingController openDateController = TextEditingController();
  final TextEditingController openTimeController = TextEditingController();
  WalletData data = WalletData();
  var formKey = GlobalKey<FormState>();

  double parsedNumber = 0;
  bool repeatSwitchValue = false;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedtTime = TimeOfDay.now();
  DateTime selectOpenDate = DateTime.now();
  TimeOfDay selectOpenTime = TimeOfDay.now();
  bool notificationSwitchvalu = false;
  DateTimeRange selectRangeDate =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());

  @override
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          height: 110.h,
          width: double.infinity,
          color: MyColors.primary,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Row(
              children: [
                IconButton(
                  onPressed: () => AutoRouter.of(context).pop(),
                  icon: const Icon(Icons.arrow_back_ios),
                  color: MyColors.white,
                ),
                SizedBox(width: 45.w),
                Center(
                  child: MyText(
                    title: tr(context, 'Edit Wallet'),
                    color: Colors.white,
                    size: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.w),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return "رجاء ادخال اسم المحفظة";
                    }
                    return null;
                  },
                  controller: walletNameController,
                  keyboardType: TextInputType.name,
                  textAlign: TextAlign.right,
                  cursorColor: MyColors.primary,
                  decoration: InputDecoration(
                      hoverColor: MyColors.primary,
                      fillColor: MyColors.primary,
                      hintText: " المحفظة",
                      hintStyle:
                          TextStyle(fontSize: 18.sp, color: MyColors.grey),
                      focusColor: MyColors.primary),
                ),
                SizedBox(height: 40.h),
                TextFormField(
                  onChanged: (value) {
                    parsedNumber = double.parse(balanceController.text);
                  },
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return "رجاء ادخال الرصيد";
                    }
                    return null;
                  },
                  controller: balanceController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.right,
                  cursorColor: MyColors.primary,
                  decoration: InputDecoration(
                      hintText: "الرصيد الحالي",
                      hintStyle:
                          TextStyle(fontSize: 18.sp, color: MyColors.grey),
                      focusColor: MyColors.primary),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.calendar_month),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: MyText(
                          title: "تاريخ فتح المحفظة",
                          color: MyColors.black,
                          size: 14.sp),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    InkWell(
                        onTap: () {
                          chosenOpenDate();
                        },
                        child: Text(
                          '${selectOpenDate.month}/${selectOpenDate.day}/${selectOpenDate.year}',
                          style: TextStyle(fontSize: 14.sp),
                        )),
                    SizedBox(
                      width: 60.w,
                    ),
                    InkWell(
                        onTap: () {
                          chosenOpenTime();
                        },
                        child: Text(
                          ' ${selectOpenTime.minute}: ${selectOpenTime.hour} ',
                          style: TextStyle(fontSize: 14.sp),
                        )),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                        title: "طريقة الدفع",
                        color: MyColors.black,
                        size: 14.sp),
                    SizedBox(
                      width: 150.w,
                      child: TileDropdownButton(
                        menuList: context.watch<WalletCubit>().paymentMethod,
                        value: context.read<WalletCubit>().paymentMethod.first,
                        onChanged: (value) => {
                          paymentMethodController.text = value as String,
                        },
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          context.read<WalletCubit>().addPaymentMethodValue(
                                context,
                                build,
                                paymentMethodController,
                              );
                        },
                        icon: const Icon(Icons.add))
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
                          menuList: context.watch<WalletCubit>().walletCategory,
                          value:
                              context.read<WalletCubit>().walletCategory.first,
                          onChanged: (value) {
                            categoryController.text = value as String;
                          }),
                    ),
                    IconButton(
                        onPressed: () {
                          context.read<WalletCubit>().addCategoryMethodValue(
                                context,
                                build,
                                categoryController,
                              );
                        },
                        icon: const Icon(Icons.add))
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
                        menuList: context.watch<WalletCubit>().encomeSource,
                        value: context.read<WalletCubit>().encomeSource.first,
                        onChanged: (value) {
                          encomSourceController.text = value as String;
                        },
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          context.read<WalletCubit>().addEncomeSourceValue(
                              context, build, encomSourceController);
                        },
                        icon: const Icon(Icons.add))
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
                          menuList: context.watch<WalletCubit>().valueCategory,
                          value:
                              context.read<WalletCubit>().valueCategory.first,
                          onChanged: (value) {
                            valueCategoryController.text = value as String;
                          }),
                    ),
                    IconButton(
                        onPressed: () {
                          context.read<WalletCubit>().addValueCategory(
                              context, build, valueCategoryController);
                        },
                        icon: const Icon(Icons.add))
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                        title: "تحديد  المحفظة الافتراضية",
                        color: MyColors.black,
                        size: 14.sp),
                    Checkbox(
                        activeColor: MyColors.primary,
                        value: context.read<WalletCubit>().checkedValue,
                        onChanged: (newValue) {
                          setState(() {
                            context.read<WalletCubit>().checkedValue =
                                newValue!;
                          });
                        })
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: MyText(
                          title: "تكرار المحفظة",
                          color: MyColors.black,
                          size: 14.sp),
                    ),
                    Visibility(
                      visible: repeatSwitchValue,
                      child: SizedBox(
                        width: 150.w,
                        child: TileDropdownButton(
                            menuList: context.watch<WalletCubit>().repeatWallet,
                            value:
                                context.read<WalletCubit>().repeatWallet.first,
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
                Visibility(
                  visible: repeatSwitchValue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                          title: "عدد مرات تكرار المحفظة",
                          color: MyColors.black,
                          size: 14.sp),
                      SizedBox(
                        width: 150.w,
                        child: TileDropdownButton(
                            menuList:
                                context.watch<WalletCubit>().walletDuplicate,
                            value: context
                                .read<WalletCubit>()
                                .walletDuplicate
                                .first,
                            onChanged: (value) {}),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: MyText(
                          title: "تنبيه عند انتهاء 20%",
                          color: MyColors.black,
                          size: 14.sp),
                    ),
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
                DefaultButton(
                  fontSize: 12.sp,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      widget.model.walletOpiningDate = openDateController.text;
                      widget.model.walletOpiningTime = openTimeController.text;
                      widget.model.checkedValue =
                          context.read<WalletCubit>().checkedValue;

                      widget.model.walletPeriod = rangeDateController.text;
                      widget.model.walletOpiningDate = openDateController.text;
                      widget.model.valueCategory =
                          valueCategoryController.text == ""
                              ? data.valueCategory.first
                              : valueCategoryController.text;
                      widget.model.encomeSource =
                          encomSourceController.text == ""
                              ? data.encomeSource.first
                              : encomSourceController.text;
                      widget.model.date = selectedDate.microsecondsSinceEpoch;
                      widget.model.time = selectedtTime.minute;
                      widget.model.category = categoryController.text == ""
                          ? data.walletCategory.first
                          : categoryController.text;
                      widget.model.paymentMethod =
                          paymentMethodController.text == ""
                              ? data.paymentMethod.first
                              : paymentMethodController.text;
                      widget.model.balance = parsedNumber;
                      widget.model.name = walletNameController.text;
                      widget.model.save();
                      AutoRouter.of(context).pop();
                    }
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

  void chosenOpenDate() async {
    var chosenDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now().add(const Duration(days: 30)),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)));

    if (chosenDate != null) {
      selectOpenDate = chosenDate;
      openDateController.text = selectedDate.toString();
      setState(() {});
    }
  }

  void chosenOpenTime() async {
    var chosenDate = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (chosenDate != null) {
      selectOpenTime = chosenDate;
      openTimeController.text = selectedtTime.toString();
      setState(() {});
    }
  }
}
