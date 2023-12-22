import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/widgets/DefaultButton.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/user/screens/settings/widgets/settings_widgets_imports.dart';
import 'package:expenses/user/screens/wallet/wallet_imports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddBudgetItem extends StatefulWidget {
  const AddBudgetItem({super.key});

  @override
  State<AddBudgetItem> createState() => _AddBudgetItemState();
}

class _AddBudgetItemState extends State<AddBudgetItem> {
  bool repeatSwitchValue = false;
  bool notificationSwitchvalu = false;

  @override
  Widget build(BuildContext context) {
    WalletData data = WalletData();

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
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              TextFormField(
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return "رجاء ادخال اسم المحفظة";
                  }
                  return null;
                },
                keyboardType: TextInputType.name,
                textAlign: TextAlign.right,
                cursorColor: MyColors.primary,
                decoration: InputDecoration(
                    hoverColor: MyColors.primary,
                    fillColor: MyColors.primary,
                    hintText: " enter value",
                    hintStyle: TextStyle(fontSize: 18.sp, color: MyColors.grey),
                    focusColor: MyColors.primary),
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                      title: "اختيار معاملة",
                      color: MyColors.black,
                      size: 14.sp),
                  SizedBox(
                    width: 150.w,
                    child: TileDropdownButton(
                      menuList: data.paymentMethod,
                      value: data.paymentMethod.first,
                      onChanged: (value) => {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                      title: "اختيار محفظة",
                      color: MyColors.black,
                      size: 14.sp),
                  SizedBox(
                    width: 150.w,
                    child: TileDropdownButton(
                      menuList: data.paymentMethod,
                      value: data.paymentMethod.first,
                      onChanged: (value) => {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  MyText(
                      title: "اختيار المدة",
                      color: MyColors.black,
                      size: 14.sp),
                ],
              ),
              SizedBox(height: 15.h),
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
                height: 30.h,
              ),
              DefaultButton(
                fontSize: 14.sp,
                borderColor: MyColors.primary,
                title: "إضافة محفظة",
                color: MyColors.primary,
                onTap: () {},
              )
            ],
          ),
        ),
      ],
    );
  }
}
