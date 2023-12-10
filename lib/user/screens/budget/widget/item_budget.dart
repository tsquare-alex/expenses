import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ItemBudget extends StatelessWidget {
  final String title;
  final String value;
  final String secValue;
  final double precent;

  const ItemBudget(
      {super.key,
      required this.title,
      required this.value,
      required this.precent,
      required this.secValue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText(title: title, color: MyColors.black, size: 18.sp),
          SizedBox(
            height: 5.h,
          ),
          LinearPercentIndicator(
            isRTL: true,
            alignment: MainAxisAlignment.end,
            width: 330.w,
            animation: true,
            lineHeight: 20.0,
            animationDuration: 2000,
            percent: precent,
            progressColor: MyColors.primary,
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              MyText(title: "المصاريف", color: MyColors.grey, size: 12.sp),
              SizedBox(
                width: 6.w,
              ),
              const Text("valu"),
              SizedBox(
                width: 60.w,
              ),
              MyText(title: "من", color: MyColors.black, size: 12.sp),
              SizedBox(
                width: 95.w,
              ),
              MyText(title: secValue, color: MyColors.black, size: 12.sp)
            ],
          )
        ],
      ),
    );
  }
}
