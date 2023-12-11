import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/widgets/DefaultButton.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/user/screens/budget/widget/transaction_header.dart';
import 'package:expenses/user/screens/settings/widgets/settings_widgets_imports.dart';
import 'package:expenses/user/screens/wallet/wallet_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BalanceTransfer extends StatefulWidget {
  const BalanceTransfer({super.key});

  @override
  State<BalanceTransfer> createState() => _BalanceTransferState();
}

class _BalanceTransferState extends State<BalanceTransfer> {
  WalletData data = WalletData();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedtTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Column(
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
          padding: EdgeInsets.all(12.w),
          child: Column(
            children: [
              const TransctionHeader(),
              SizedBox(
                height: 30.h,
              ),
              Row(
                children: [
                  MyText(title: "من", color: MyColors.black, size: 16.sp),
                  SizedBox(
                    width: 50.w,
                  ),
                  SizedBox(
                    width: 90.w,
                    child: TileDropdownButton(
                        menuList: data.walletType,
                        value: data.walletType.first,
                        onChanged: (value) {}),
                  ),
                ],
              ),
              Row(
                children: [
                  MyText(title: "الي", color: MyColors.black, size: 16.sp),
                  SizedBox(
                    width: 50.w,
                  ),
                  SizedBox(
                    width: 90.w,
                    child: TileDropdownButton(
                        menuList: data.walletType,
                        value: data.walletType.first,
                        onChanged: (value) {}),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
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
                height: 50.h,
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
                fontSize: 12.sp,
                onTap: () {},
                borderColor: MyColors.primary,
                title: "تحويل",
                color: MyColors.primary,
              )
            ],
          ),
        ),
      ],
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
