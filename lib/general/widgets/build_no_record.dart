
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildNoRecord extends StatelessWidget {
  const BuildNoRecord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20.r),
            child: Image.asset(
              Res.searchRecords,
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          MyText(
            title: "No Record",
            color: MyColors.black,
            size: 16.sp,
            fontWeight: FontWeight.bold,
          ),
          MyText(
            title: "Tap the + button to add your first record.",
            color: MyColors.grey,
            size: 14.sp,
          ),
        ],
      ),
    );
  }
}
