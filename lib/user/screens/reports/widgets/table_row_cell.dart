import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReportsRowCell extends StatelessWidget {
  const ReportsRowCell({
    Key? key,
    required this.title,
    this.padding,
    this.isCenter = false,
    this.isCategory = false,
    this.categoryColor,
  }) : super(key: key);

  final String title;
  final double? padding;
  final bool isCenter;
  final bool isCategory;
  final Color? categoryColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding ?? 10.r),
      child: isCategory
          ? Row(
              children: [
                CircleAvatar(
                  backgroundColor: categoryColor,
                  radius: 8.r,
                ),
                SizedBox(width: 12.r),
                Flexible(
                  child: Text(
                    title,
                    textAlign: isCenter ? TextAlign.center : null,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            )
          : Text(
              title,
              textAlign: isCenter ? TextAlign.center : null,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
    );
  }
}
