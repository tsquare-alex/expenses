import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDrawerCard extends StatelessWidget {
  const CustomDrawerCard(
      {
        Key? key,
        this.onTap,
        this.title,
        this.image,
        this.imageColor,
        required this.endDrawer, this.color, this.textColor,
      }
      ) : super(key: key);

  final Function()? onTap;
  final String? title;
  final String? image;
  final Color? imageColor;
  final Color? color;
  final Color? textColor;
  final bool endDrawer;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.r),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: color??MyColors.primary
        ),
        child: Row(
          children: [
            if(image!=null)Image.asset(
                '$image',
              color: imageColor??MyColors.white,
              width: 25.w,
                height: 25.h,
            ),
            SizedBox(
              width: 10.w,
            ),
            MyText(
              title: "$title",
              fontWeight: FontWeight.bold,
              size: 14,
              color: textColor??MyColors.white,
            )
          ],
        ),
      ),
    );
  }
}
