import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/user/screens/budget/data/model/budget_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ItemBudget extends StatelessWidget {
  final BudgetModel model;

  const ItemBudget({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText(title: model.name, color: MyColors.black, size: 18.sp),
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
            percent: 0.3,
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
              SizedBox(
                width: 60.w,
              ),
              MyText(title: "من", color: MyColors.black, size: 12.sp),
              SizedBox(
                width: 95.w,
              ),
            ],
          )
        ],
      ),
    );
  }
}
