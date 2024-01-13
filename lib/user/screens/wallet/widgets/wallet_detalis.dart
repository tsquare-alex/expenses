import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/utilities/routers/RouterImports.gr.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/res.dart';
import 'package:expenses/user/screens/wallet/data/cubit/wallet_cubit/wallet_cubit.dart';
import 'package:expenses/user/screens/wallet/data/model/wallet/wallet_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WalletDetails extends StatelessWidget {
  final WalletModel model;
  const WalletDetails({
    super.key,
    required this.model,
  });

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
                onTap: () async {
                  await AutoRouter.of(context)
                      .push(BalanceWithdrawalRoute(model: model));
                  if (context.mounted) {
                    context.read<WalletCubit>().fetchAllData();
                  }
                },
                child: Row(
                  children: [
                    Image.asset(Res.withdrawal),
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
                onTap: () async {
                  await AutoRouter.of(context)
                      .push(AddBalanceRoute(model: model));
                  if (context.mounted) {
                    context.read<WalletCubit>().fetchAllData();
                  }
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
                  AutoRouter.of(context).push(
                    WalletBalanceTransferRoute(model: model),
                  );
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
                onTap: () {
                  AutoRouter.of(context)
                      .push(WalletTransactionsRoute(model: model));
                },
                child: InkWell(
                  onTap: () => AutoRouter.of(context)
                      .push(WalletBalanceTransferRoute(model: model)),
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
              ),
            ],
          ),
        ),
      ],
    );
  }
}
