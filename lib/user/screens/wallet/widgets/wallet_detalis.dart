import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/utilities/routers/RouterImports.gr.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/user/screens/wallet/wallet_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WalletDetails extends StatefulWidget {
  const WalletDetails({
    super.key,
  });

  @override
  State<WalletDetails> createState() => _WalletDetailsState();
}

class _WalletDetailsState extends State<WalletDetails> {
  static const String title = "سحب رصيد";
  static const String secTitle = "اضافة رصيد";
  WalletData data = WalletData();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 120.h,
          width: double.infinity,
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(color: MyColors.greyWhite),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  data.balanceTransaction(context, title, () {});
                },
                child: Row(
                  children: [
                    const Icon(Icons.money),
                    SizedBox(width: 12.w),
                    MyText(
                        title: "سحب رصيد", color: MyColors.black, size: 12.sp),
                  ],
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              InkWell(
                onTap: () {
                  data.balanceTransaction(context, secTitle, () {});
                },
                child: Row(
                  children: [
                    const Icon(Icons.money),
                    SizedBox(width: 12.w),
                    MyText(
                        title: "اضافة رصيد",
                        color: MyColors.black,
                        size: 12.sp),
                  ],
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              InkWell(
                onTap: () {
                  AutoRouter.of(context).push(const BalanceTransferRoute());
                },
                child: Row(
                  children: [
                    const Icon(Icons.money),
                    SizedBox(width: 12.w),
                    MyText(
                        title: "تحويل رصيد بين المحفظة",
                        color: MyColors.black,
                        size: 12.sp),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Container(
          height: 60.h,
          width: double.infinity,
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(color: MyColors.greyWhite),
          child: Column(
            children: [
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    const Icon(Icons.money),
                    SizedBox(width: 12.w),
                    MyText(
                        title: "عرض المعاملات",
                        color: MyColors.black,
                        size: 12.sp),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
