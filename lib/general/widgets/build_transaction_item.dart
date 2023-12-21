import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/themes/app_colors.dart';
import 'package:expenses/general/themes/cubit/app_theme_cubit.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildTransactionItem extends StatelessWidget {
  const BuildTransactionItem(
      {Key? key, required this.name, this.image, this.content, this.hasContent=false, this.onTap, this.radius, this.width, this.height,})
      : super(key: key);
  final String name;
  final String? image;
  final double? radius;
  final double? width;
  final double? height;
  final Widget? content;
  final bool? hasContent;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: context.watch<AppThemeCubit>().isDarkMode?AppDarkColors.primary:MyColors.primary,
                radius: radius??25.r,
                child: image!=null?Image.asset(
                  image??"",
                  width: width??25.w,
                  height: height??25.w,
                  color: MyColors.white,
                ):Container(),
              ),
              SizedBox(
                width: 15.w,
              ),
              MyText(
                title: name,
                color: context.watch<AppThemeCubit>().isDarkMode?MyColors.white:MyColors.black,
                size: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
        if(hasContent==true)Padding(
          padding: EdgeInsets.only(right: 30.r),
          child: content,
        ),
        hasContent==false?Divider(
          thickness: 1.w,
        ):Container(),
      ],
    );
  }
}
