import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/widgets/DefaultButton.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/user/screens/settings/widgets/settings_widgets_imports.dart';
import 'package:expenses/user/screens/wallet/data/model/wallet_model.dart';
import 'package:expenses/user/screens/wallet/wallet_imports.dart';
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
  final TextEditingController dropdownButtonController =
      TextEditingController();
  WalletData data = WalletData();
  double parsedNumber = 0;

  @override
  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
            TextFormField(
              controller: walletNameController,
              keyboardType: TextInputType.name,
              textAlign: TextAlign.right,
              cursorColor: MyColors.primary,
              decoration: InputDecoration(
                  hoverColor: MyColors.primary,
                  fillColor: MyColors.primary,
                  hintText: widget.model.walletName,
                  hintStyle: TextStyle(fontSize: 18.sp, color: MyColors.grey),
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
                        hintStyle:
                            TextStyle(fontSize: 18.sp, color: MyColors.grey),
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
                    title: "طريقة الدفع", color: MyColors.black, size: 16.sp),
                SizedBox(
                  width: 50.w,
                ),
                SizedBox(
                  width: 150.w,
                  child: TileDropdownButton(
                    menuList: data.paymentMethod,
                    value: data.paymentMethod.first,
                    onChanged: (value) => {
                      dropdownButtonController.text = value as String,
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100.h,
            ),
            DefaultButton(
              fontSize: 12.sp,
              onTap: () {
                widget.model.paymentMethod = dropdownButtonController.text;
                widget.model.balance = parsedNumber;
                widget.model.walletName = walletNameController.text;
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
    ]);
  }
}
