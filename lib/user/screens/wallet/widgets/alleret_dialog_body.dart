import 'package:expenses/general/constants/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlertDialgBody extends StatelessWidget {
  const AlertDialgBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70.h,
        width: double.infinity,
        padding: EdgeInsets.all(12.w),
        child: Column(
          children: [
            Row(
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
                      width: 10.w,
                    ),
                    SizedBox(
                      width: 140.w,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.right,
                        cursorColor: MyColors.primary,
                        decoration: InputDecoration(
                            hintText: "المبلغ",
                            hintStyle: TextStyle(
                                fontSize: 12.sp, color: MyColors.grey),
                            focusColor: MyColors.primary),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
