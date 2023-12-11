import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/user/screens/wallet/wallet_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  final String walletNumber;
  final String walletCategory;
  final String availableBalance;
  final String balance;
  const CustomContainer(
      {super.key,
      required this.walletNumber,
      required this.walletCategory,
      required this.availableBalance,
      required this.balance});

  @override
  Widget build(BuildContext context) {
    WalletData data = WalletData();
    return Container(
      padding: EdgeInsets.all(18.w),
      height: 180.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r), color: MyColors.primary),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(title: walletNumber, color: MyColors.white, size: 16.sp),
              IconButton(
                  onPressed: () {
                    data.showButtomSheet(context, build);
                  },
                  icon: Icon(
                    Icons.arrow_drop_down_outlined,
                    color: MyColors.white,
                  ))
            ],
          ),
          MyText(title: walletCategory, color: MyColors.white, size: 16.sp),
          MyText(title: availableBalance, color: MyColors.white, size: 16.sp),
          MyText(title: balance, color: MyColors.white, size: 16.sp),
        ],
      ),
    );
  }
}
