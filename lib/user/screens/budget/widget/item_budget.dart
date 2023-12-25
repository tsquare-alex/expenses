import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/user/screens/budget/data/cubit/budget_cubit.dart';
import 'package:expenses/user/screens/budget/data/cubit/budget_state.dart';
import 'package:expenses/user/screens/budget/data/model/budget_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ItemBudget extends StatelessWidget {
  final BudgetModel model;
  final double percent;

  const ItemBudget({
    super.key,
    required this.model,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BudgetCubit, BudgetState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(12.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Align(
                child: MyText(
                    title: "${model.value}",
                    color: MyColors.black,
                    size: 18.sp),
              ),
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
                percent: percent,
                progressColor: MyColors.primary,
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(title: "الميزانية", color: MyColors.grey, size: 12.sp),
                  IconButton(
                      onPressed: () {
                        model.delete();
                        BlocProvider.of<BudgetCubit>(context).fetchData();
                      },
                      icon: Icon(
                        Icons.delete,
                        color: MyColors.primary,
                      ))
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
