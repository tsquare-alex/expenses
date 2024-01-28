import 'package:expenses/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/themes/app_colors.dart';
import 'package:expenses/general/themes/cubit/app_theme_cubit.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDrawerCard extends StatelessWidget {
  const CustomDrawerCard({
    Key? key,
    this.onTap,
    this.title,
    this.image,
    this.imageColor,
    required this.endDrawer,
    this.color,
    this.textColor,
    this.isPro = false,
    this.hasSwitch = false,
    this.hasArrowBack = false,
    this.hasProStack = false,
    this.switchWidget,
  }) : super(key: key);

  final Function()? onTap;
  final String? title;
  final String? image;
  final Color? imageColor;
  final Color? color;
  final Color? textColor;
  final bool endDrawer;
  final bool? isPro;
  final bool? hasSwitch;
  final bool? hasArrowBack;
  final bool? hasProStack;
  final Widget? switchWidget;

  @override
  Widget build(BuildContext context) {
    var lang = context.watch<LangCubit>().state.locale.languageCode;
    return InkWell(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.r, vertical: 20.r),
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: color != null
                  ? color
                  : context.watch<AppThemeCubit>().isDarkMode
                      ? AppDarkColors.primary
                      : MyColors.white,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                width: 3.w,
                color: MyColors.greyWhite,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      if (image != null)
                        Image.asset(
                          '$image',
                          // color: imageColor??MyColors.white,
                          width: 25.w,
                          height: 25.h,
                        ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: MyText(
                          title: "$title",
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                          size: 14.sp,
                          color: context.watch<AppThemeCubit>().isDarkMode
                              ? MyColors.white
                              : MyColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                if (isPro == true)
                  Image.asset(
                    Res.pro,
                    width: 45.w,
                    height: 45.h,
                  ),
                if (hasArrowBack == true)
                  Icon(
                    lang=="ar"?Icons.keyboard_arrow_left_outlined:Icons.keyboard_arrow_right_outlined,
                    color: MyColors.primary,
                  ),
                if (hasSwitch == true) switchWidget ?? Container(),
              ],
            ),
          ),
          if (hasProStack == true)
            Image.asset(
              Res.pro,
              width: 45.w,
              height: 45.h,
            ),
        ],
      ),
    );
  }
}
