import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/input_fields/GenericTextField.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/widgets/DefaultButton.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/res.dart';
import 'package:expenses/user/screens/settings/widgets/settings_widgets_imports.dart';
import 'package:expenses/user/screens/wallet/data/model/wallet/wallet_model.dart';
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
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  bool repeatSwitchValue = false;
  DateTime? selectedDate;
  DateTime? closedDate;
  var formKey = GlobalKey<FormState>();

  WalletData data = WalletData();
  double enterAmount = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.white,
          leading: IconButton(
            icon: Image.asset(Res.back),
            onPressed: () => AutoRouter.of(context).pop(),
          ),
          title: Center(
            child: MyText(
              title: tr(context, 'withdrawbalance'),
              color: MyColors.black,
              size: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.r),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 20.h),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            title: tr(context, "amountWithdraw"),
                            color: MyColors.black,
                            size: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          GenericTextField(
                            hint: tr(context, "amount"),
                            controller: controller,
                            fieldTypes: FieldTypes.normal,
                            type: TextInputType.number,
                            action: TextInputAction.next,
                            validate: (text) {
                              if (text == null || text.isEmpty) {
                                return tr(context, "pleaseEnterValue");
                              }
                              return null;
                            },
                            onChange: (value) {
                              setState(() {
                                enterAmount = double.parse(controller.text);
                              });
                            },
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyText(
                                title: tr(context, "currentAmount"),
                                color: MyColors.black,
                                size: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
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
                                title: tr(context, "remainingAmount"),
                                color: MyColors.black,
                                size: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              MyText(
                                  title:
                                      "${widget.model.balance - enterAmount}",
                                  color: MyColors.primary,
                                  size: 16.sp)
                            ],
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  MyText(
                                    title: tr(context, "sourceDuration"),
                                    color: MyColors.black,
                                    size: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Row(
                                children: [
                                  Container(
                                      height: 44.h,
                                      width: 170.w,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        border: Border.all(
                                            color:
                                                MyColors.semiTransparentColor),
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          openDate(context);
                                        },
                                        child: Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(12.r),
                                            child: Row(
                                              children: [
                                                Image.asset(Res.calendar),
                                                SizedBox(
                                                  width: 15.w,
                                                ),
                                                Text(
                                                  selectedDate != null
                                                      ? "${selectedDate?.toLocal()}"
                                                          .split(' ')[0]
                                                      : tr(context,
                                                          "walletOpeningDate"),
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: selectedDate != null
                                                        ? Colors.black
                                                        : Colors.grey,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  Container(
                                      height: 44.h,
                                      width: 170.w,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        border: Border.all(
                                            color:
                                                MyColors.semiTransparentColor),
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          closeDate(context);
                                        },
                                        child: Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(12.r),
                                            child: Row(
                                              children: [
                                                Image.asset(Res.calendar),
                                                SizedBox(
                                                  width: 15.w,
                                                ),
                                                Text(
                                                  closedDate != null
                                                      ? "${closedDate?.toLocal()}"
                                                          .split(' ')[0]
                                                      : tr(context,
                                                          "walletClosingDate"),
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: closedDate != null
                                                        ? Colors.black
                                                        : Colors.grey,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )),
                                ],
                              ),
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
                                    title: tr(context, "repetition"),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DefaultButton(
                      height: 57.h,
                      width: 192.w,
                      fontSize: 12.sp,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          double result = widget.model.balance - enterAmount;
                          widget.model.balance = result;
                          widget.model.save();
                          AutoRouter.of(context).pop();
                        }
                      },
                      borderColor: MyColors.primary,
                      title: tr(context, "withdrawBalance"),
                      color: MyColors.primary,
                    ),
                    DefaultButton(
                      height: 57.h,
                      width: 192.w,
                      textColor: MyColors.primary,
                      fontSize: 12.sp,
                      title: tr(context, "cancel"),
                      onTap: () {
                        AutoRouter.of(context).pop();
                      },
                      borderColor: MyColors.primary,
                      color: MyColors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> openDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        startDate.text = selectedDate.toString();
      });
    }
  }

  Future<void> closeDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: closedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != closedDate) {
      setState(() {
        closedDate = picked;
        endDate.text = closedDate.toString();
      });
    }
  }

  @override
  void dispose() {
    closedDate;
    startDate;
    controller;
    super.dispose();
  }
}
