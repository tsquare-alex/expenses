import 'package:expenses/general/constants/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransctionHeader extends StatelessWidget {
  const TransctionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
              width: 20.w,
            ),
            SizedBox(
              width: 270.w,
              child: TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.right,
                cursorColor: MyColors.primary,
                decoration: InputDecoration(
                    suffixIcon: Image.asset(
                      "assets/images/calculator.png",
                    ),
                    hintText: "المبلغ",
                    hintStyle: TextStyle(fontSize: 18.sp, color: MyColors.grey),
                    focusColor: MyColors.primary),
              ),
            ),
          ],
        )
      ],
    );
  }
}
