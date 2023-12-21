import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/widgets/DefaultButton.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/user/screens/settings/widgets/settings_widgets_imports.dart';
import 'package:expenses/user/screens/wallet/data/cubit/wallet_cubit/wallet_cubit.dart';
import 'package:expenses/user/screens/wallet/data/cubit/wallet_cubit/wallet_state.dart';
import 'package:expenses/user/screens/wallet/data/model/wallet_model.dart';
import 'package:expenses/user/screens/wallet/wallet_imports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddWallet extends StatefulWidget {
  const AddWallet({super.key});

  @override
  State<AddWallet> createState() => _AddWalletState();
}

class _AddWalletState extends State<AddWallet> {
  var formKey = GlobalKey<FormState>();
  final TextEditingController walletNameController = TextEditingController();
  final TextEditingController balanceController = TextEditingController();
  final TextEditingController dropdownButtonController =
      TextEditingController();
  WalletData data = WalletData();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedtTime = TimeOfDay.now();
  bool repeatSwitchValue = false;
  bool notificationSwitchvalu = false;
  // String formattedTime = selectedtTime.format(context);
  // String formattedDate = selectedDate.format(context);

  _AddWalletState();
  String? balance;
  double parsedNumber = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WalletCubit(),
      child: SingleChildScrollView(
        child: Column(
          children: [
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
              padding: EdgeInsets.all(16.w),
              child: BlocConsumer<WalletCubit, WalletState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return Form(
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
                              hintStyle: TextStyle(
                                  fontSize: 18.sp, color: MyColors.grey),
                              focusColor: MyColors.primary),
                        ),
                        SizedBox(height: 40.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 100.w,
                              child: TileDropdownButton(
                                  menuList: data.curancyType,
                                  value: data.curancyType.first,
                                  onChanged: (value) {}),
                            ),
                            SizedBox(
                              width: 170.w,
                              child: TextFormField(
                                onChanged: (value) {
                                  parsedNumber =
                                      double.parse(balanceController.text);
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
                                    hintStyle: TextStyle(
                                        fontSize: 18.sp, color: MyColors.grey),
                                    focusColor: MyColors.primary),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
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
                                menuList: data.paymentMethod,
                                value: data.paymentMethod.first,
                                onChanged: (value) => {
                                  dropdownButtonController.text =
                                      value as String,
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
                                title: "التصنيف",
                                color: MyColors.black,
                                size: 14.sp),
                            SizedBox(
                              width: 150.w,
                              child: TileDropdownButton(
                                  menuList: data.walletCategory,
                                  value: data.walletCategory.first,
                                  onChanged: (value) {}),
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
                                  onChanged: (value) {}),
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
                                  onChanged: (value) {}),
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
                                title: "تكرار المعاملة",
                                color: MyColors.black,
                                size: 14.sp),
                            Visibility(
                              visible: repeatSwitchValue,
                              child: SizedBox(
                                width: 150.w,
                                child: TileDropdownButton(
                                    menuList: data.repeatTransaction,
                                    value: data.repeatTransaction.first,
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
                                title: "التنبيه بالمعاملة",
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
                        DefaultButton(
                          fontSize: 14.sp,
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              var walletModel = WalletModel(
                                  name: walletNameController.text,
                                  balance: parsedNumber,
                                  paymentMethod:
                                      dropdownButtonController.text == ""
                                          ? data.paymentMethod.first
                                          : dropdownButtonController.text);
                              await BlocProvider.of<WalletCubit>(context)
                                  .addNote(walletModel);
                              if (context.mounted) {
                                AutoRouter.of(context).pop();
                              }
                            }
                          },
                          borderColor: MyColors.primary,
                          title: "إضافة محفظة",
                          color: MyColors.primary,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
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
