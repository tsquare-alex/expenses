import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/utilities/routers/RouterImports.gr.dart';
import 'package:expenses/general/utilities/utils_functions/LoadingDialog.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/res.dart';
import 'package:expenses/user/screens/wallet/data/cubit/wallet_cubit/wallet_cubit.dart';
import 'package:expenses/user/screens/wallet/data/model/wallet/wallet_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatefulWidget {
  final WalletModel model;

  const CustomContainer({
    super.key,
    required this.model,
  });

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();

    currentDate.isAfter(context.read<WalletCubit>().endDate);
    return Container(
      padding: EdgeInsets.all(12.r),
      height: 230.h,
      width: 414.w,
      decoration: BoxDecoration(
        image:
            const DecorationImage(image: AssetImage(Res.contanier_background)),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.r, horizontal: 12.r),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      widget.model.iconPath!,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    MyText(
                      title: widget.model.category,
                      color: MyColors.white,
                      size: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                Visibility(
                  visible: !widget.model.isClosed!,
                  child: IconButton(
                    onPressed: () => showModalBottomSheet(
                        isScrollControlled: true,
                        elevation: 0,
                        context: context,
                        builder: (buildContext) {
                          return Container(
                            height: 300.h,
                            padding: EdgeInsets.all(16.w),
                            decoration: BoxDecoration(color: MyColors.white),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () async {
                                    await AutoRouter.of(context).push(
                                        BalanceWithdrawalRoute(
                                            model: widget.model));
                                    if (context.mounted) {
                                      context
                                          .read<WalletCubit>()
                                          .fetchAllData();
                                    }
                                  },
                                  child: Container(
                                    height: 60.h,
                                    width: double.infinity,
                                    padding: EdgeInsets.all(16.w),
                                    decoration: const BoxDecoration(
                                      color: Color(0xffF7F7F6),
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          Res.withdraw,
                                          height: 24.h,
                                          width: 24.w,
                                        ),
                                        SizedBox(width: 12.w),
                                        MyText(
                                          title: "سحب رصيد",
                                          color: MyColors.black,
                                          size: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                InkWell(
                                  onTap: () async {
                                    await AutoRouter.of(context).push(
                                        AddBalanceRoute(model: widget.model));
                                    if (context.mounted) {
                                      context
                                          .read<WalletCubit>()
                                          .fetchAllData();
                                    }
                                  },
                                  child: Container(
                                    height: 60.h,
                                    width: double.infinity,
                                    padding: EdgeInsets.all(16.w),
                                    decoration: const BoxDecoration(
                                      color: Color(0xffF7F7F6),
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          Res.add_balance,
                                          height: 24.h,
                                          width: 28.w,
                                        ),
                                        SizedBox(width: 12.w),
                                        MyText(
                                          title: "اضافة رصيد",
                                          color: MyColors.black,
                                          size: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                InkWell(
                                  onTap: () {
                                    AutoRouter.of(context).push(
                                      WalletBalanceTransferRoute(
                                          model: widget.model),
                                    );
                                  },
                                  child: Container(
                                    height: 60.h,
                                    width: double.infinity,
                                    padding: EdgeInsets.all(16.w),
                                    decoration: const BoxDecoration(
                                      color: Color(0xffF7F7F6),
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          Res.balance_transfare,
                                          height: 33.h,
                                          width: 24.w,
                                        ),
                                        SizedBox(width: 12.w),
                                        MyText(
                                          title: "تحويل رصيد بين المحفظة",
                                          color: MyColors.black,
                                          size: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () => AutoRouter.of(context).push(
                                          WalletTransactionsRoute(
                                              model: widget.model)),
                                      child: Container(
                                        height: 60.h,
                                        width: double.infinity,
                                        padding: EdgeInsets.all(16.w),
                                        decoration: const BoxDecoration(
                                          color: Color(0xffF7F7F6),
                                        ),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              Res.show_transactions,
                                              height: 26.h,
                                              width: 28.w,
                                            ),
                                            SizedBox(width: 12.w),
                                            MyText(
                                                title: "عرض المعاملات",
                                                color: MyColors.black,
                                                size: 16.sp,
                                                fontWeight: FontWeight.w600),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                    icon: Image.asset(
                      Res.more,
                      height: 12.h,
                      width: 12.w,
                    ),
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Visibility(
                    visible: !widget.model.isHide!,
                    child: MyText(
                        alien: TextAlign.end,
                        title: widget.model.balance.toStringAsFixed(2),
                        color: MyColors.white,
                        size: 22.sp),
                  ),
                  MyText(
                    title: "الرصيد المتاح",
                    color: MyColors.white,
                    size: 10.sp,
                    fontWeight: FontWeight.w400,
                    alien: TextAlign.end,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    context.read<WalletCubit>().toggleWalletLock(widget.model);
                    if (widget.model.isClosed!) {
                      // ignore: void_checks
                      return CustomToast.showSimpleToast(
                          msg: "المحفظة مغلة حاليا");
                    } else {
                      // ignore: void_checks
                      return CustomToast.showSimpleToast(
                          msg: "المحفظة متاحة حاليا");
                    }
                  },
                  icon: Visibility(
                    visible: !widget.model.isClosed!,
                    replacement: Icon(
                      Icons.lock_clock_outlined,
                      color: MyColors.white,
                    ),
                    child: Image.asset(
                      Res.lock,
                      height: 24.h,
                      width: 24.w,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    context
                        .read<WalletCubit>()
                        .toggleBalanceVisibility(widget.model);
                  },
                  icon: Visibility(
                      visible: !widget.model.isHide!,
                      replacement: Image.asset(
                        Res.visability,
                        height: 24.h,
                        width: 24.w,
                      ),
                      child: Image.asset(
                        Res.visability,
                        height: 24.h,
                        width: 24.w,
                      )),
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
                                    AutoRouter.of(context).pop();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(8.w),
                                    decoration: const BoxDecoration(
                                      color: Color(0xffF7F7F6),
                                    ),
                                    child: Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.delete),
                                          color: MyColors.primary,
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        MyText(
                                          title: " حذف المحفظة",
                                          color: MyColors.black,
                                          size: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
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
                                    decoration: const BoxDecoration(
                                      color: Color(0xffF7F7F6),
                                    ),
                                    child: Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Image.asset(Res.edit),
                                          color: MyColors.primary,
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        MyText(
                                          title: "تعديل المحفظة",
                                          color: MyColors.black,
                                          size: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  },
                  icon: Image.asset(
                    Res.setting,
                    height: 24.h,
                    width: 24.w,
                  ),
                  color: MyColors.white,
                ),
                widget.model.checkedValue == true
                    ? IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.star),
                        color: MyColors.white,
                      )
                    : const SizedBox(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
