import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/themes/cubit/app_theme_cubit.dart';
import 'package:expenses/general/widgets/DefaultButton.dart';
import 'package:expenses/res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Subscriptions extends StatelessWidget {
  const Subscriptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: MyColors.white,
          leading: GestureDetector(
            onTap: () => AutoRouter.of(context).pop(),
            child: Icon(
              Icons.arrow_back,
              color: context.watch<AppThemeCubit>().isDarkMode
                  ? MyColors.white
                  : MyColors.black,
            ),
          ),
          title: Text(
            tr(
              context,
              "subscriptionTitle",
            ),
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: MyColors.black),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  tr(context, "subscriptionBenefits"),
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: MyColors.black),
                ),
                SizedBox(width: 8.w),
                Image.asset(Res.bluStar, height: 20.h, width: 20.w),
              ],
            ),
            SizedBox(height: 10.h),
            Text(
              tr(context, "subscriptionBenefitsdesc"),
              style: TextStyle(
                  fontSize: 14.sp,
                  color: MyColors.grey,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Text(
                  tr(context, "subscriptionPlan"),
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: MyColors.black),
                ),
                SizedBox(width: 8.w),
                Image.asset(Res.paln, height: 20.h, width: 20.w),
              ],
            ),
            SizedBox(height: 10.h),
            Text(
              tr(context, "subscriptionOffer"),
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: MyColors.grey),
            ),
            SizedBox(height: 16.h),
            Container(
              height: 275.h,
              width: 398.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Table(
                border: TableBorder.all(color: MyColors.greyWhite),
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        child: SizedBox(
                          height: 90.h,
                          width: 135.w,
                          child: Center(
                              child: Text(
                            tr(context, "subscription30"),
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                      TableCell(
                        child: SizedBox(
                            height: 90.h,
                            width: 135.w,
                            child: Center(
                                child: Text(
                              tr(context, "subscription365"),
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.bold),
                            ))),
                      ),
                      TableCell(
                        child: SizedBox(
                            height: 95.h,
                            width: 135.w,
                            child: Center(
                                child: Text(
                              tr(context, "subscription547"),
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.bold),
                            ))),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 16.r),
                            height: 90.h,
                            width: 135.w,
                            child: Center(
                                child: Text(
                              tr(context, "subscription30Cost"),
                              style: TextStyle(
                                  fontSize: 12.sp, fontWeight: FontWeight.w600),
                            ))),
                      ),
                      TableCell(
                        child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 16.r),
                            height: 90.h,
                            width: 135.w,
                            child: Center(
                                child: Text(
                              tr(context, "subscription365Cost"),
                              style: TextStyle(
                                  fontSize: 12.sp, fontWeight: FontWeight.w600),
                            ))),
                      ),
                      TableCell(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 16.r),
                          height: 90.h,
                          width: 135.w,
                          child: Center(
                              child: Text(
                            tr(context, "subscription547Cost"),
                            style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.w600),
                          )),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: SizedBox(
                            height: 90.h,
                            width: 135.w,
                            child: Center(
                                child: Text(
                              tr(context, "18pound"),
                              style: TextStyle(
                                  fontSize: 12.sp, fontWeight: FontWeight.w600),
                            ))),
                      ),
                      TableCell(
                        child: SizedBox(
                            height: 90.h,
                            width: 135.w,
                            child: Center(
                                child: Text(
                              tr(context, "182pound"),
                              style: TextStyle(
                                  fontSize: 12.sp, fontWeight: FontWeight.w600),
                            ))),
                      ),
                      TableCell(
                        child: SizedBox(
                            height: 90.h,
                            width: 135.w,
                            child: Center(
                                child: Text(
                              tr(context, "191pound"),
                              style: TextStyle(
                                  fontSize: 12.sp, fontWeight: FontWeight.w600),
                            ))),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 35.h,
            ),
            DefaultButton(
              width: 398.w,
              title: tr(context, "SubscribeNow"),
              fontSize: 16,
              fontWeight: FontWeight.bold,
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
