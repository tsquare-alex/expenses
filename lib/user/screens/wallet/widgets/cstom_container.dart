import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/utilities/routers/RouterImports.gr.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/user/screens/wallet/data/cubit/wallet_cubit/wallet_cubit.dart';
import 'package:expenses/user/screens/wallet/data/model/wallet_model.dart';
import 'package:expenses/user/screens/wallet/wallet_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatefulWidget {
  final WalletModel model;
  final Gradient? gradient;

  const CustomContainer({
    super.key,
    required this.model,
    required this.gradient,
  });

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    WalletData data = WalletData();
    DateTime currentDate = DateTime.now();

    // bool endDatePassed =
    currentDate.isAfter(context.read<WalletCubit>().endDate);
    return BlocProvider(
      create: (context) => WalletCubit(),
      child: Container(
        padding: EdgeInsets.all(20.w),
        height: 180.h,
        decoration: BoxDecoration(
          gradient: widget.gradient,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                    title: widget.model.paymentMethod,
                    color: MyColors.white,
                    size: 18.sp),
                MyText(
                    title: widget.model.name,
                    color: MyColors.white,
                    size: 14.sp),
                IconButton(
                    onPressed: () {
                      data.showButtomSheet(context, build, widget.model);
                    },
                    icon: Icon(
                      Icons.arrow_drop_down_outlined,
                      color: MyColors.white,
                    ))
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Visibility(
                    visible: context.read<WalletCubit>().isBalanceVisible!,
                    child: MyText(
                        alien: TextAlign.end,
                        title: "${widget.model.balance}",
                        color: MyColors.white,
                        size: 22.sp),
                  ),
                  MyText(
                    title: "الرصيد المتاح",
                    color: MyColors.white,
                    size: 12,
                    alien: TextAlign.end,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.lock_open_outlined),
                  color: MyColors.white,
                ),
                IconButton(
                  onPressed: () {
                    context.read<WalletCubit>().toggleBalanceVisibility();
                  },
                  icon: Visibility(
                    visible: context.read<WalletCubit>().isBalanceVisible!,
                    child: Icon(
                      Icons.visibility_outlined,
                      color: MyColors.white,
                    ),
                    replacement: Icon(
                      Icons.visibility_off_outlined,
                      color: MyColors.white,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        elevation: 0,
                        context: context,
                        builder: (buildContext) {
                          return SizedBox(
                            height: 200.h,
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    widget.model.delete();
                                    BlocProvider.of<WalletCubit>(context)
                                        .fetchAllData();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(8.w),
                                    decoration: BoxDecoration(
                                        color: MyColors.greyWhite),
                                    child: Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.delete),
                                          color: MyColors.black,
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        MyText(
                                            title: " حذف المحفظة",
                                            color: MyColors.black,
                                            size: 12.sp),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                InkWell(
                                  onTap: () async {
                                    await AutoRouter.of(context).push(
                                        EditWalletRoute(model: widget.model));
                                    if (context.mounted) {
                                      BlocProvider.of<WalletCubit>(context)
                                          .fetchAllData();
                                    }
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(8.w),
                                    decoration: BoxDecoration(
                                        color: MyColors.greyWhite),
                                    child: Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.edit_sharp),
                                          color: MyColors.black,
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        MyText(
                                            title: "تعديل المحفظة",
                                            color: MyColors.black,
                                            size: 12.sp)
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  },
                  icon: const Icon(Icons.settings),
                  color: MyColors.white,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
