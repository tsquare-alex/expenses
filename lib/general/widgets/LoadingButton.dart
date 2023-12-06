import 'package:expenses/general/helper/configration/CustomButtonAnimation.dart';
import 'package:expenses/general/helper/configration/DecorationUtils.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/MyColors.dart';



class LoadingButton extends StatelessWidget {
  final GlobalKey<CustomButtonState> btnKey;
  final String title;
  final Function() onTap;
  final Color? textColor;
  final Color? color;
  final Color? borderColor;
  final double? borderRadius;
  final EdgeInsets? margin;
  final double? width;
  final double? fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final Widget? child;

  const LoadingButton({super.key,
    required this.title,
    required this.onTap,
    this.color,
    this.textColor,
    this.borderRadius,
    this.margin,
    this.borderColor,
    this.fontFamily,
    this.fontSize,
    this.width,
    required this.btnKey,
    this.child,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    Color border = color ?? DecorationUtils.primaryColor;
    return Container(
      margin:
      margin ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          CustomButtonAnimation(
            key: btnKey,
            onTap: onTap,
            width: width ?? MediaQuery.of(context).size.width,
            minWidth: 45,
            height: 45,
            color: color ?? DecorationUtils.primaryColor,
            borderRadius: borderRadius?? 0,
            borderSide: BorderSide(color: borderColor ?? border, width: 1),
            loader: Container(
              padding: const EdgeInsets.all(10),
              child: const SpinKitRotatingCircle(
                color: Colors.white,
                size: 20,
              ),
            ),
            child: child?? MyText(
              title: title,
              size: fontSize??11,
              color: textColor ?? MyColors.black,
              fontFamily: fontFamily,
              fontWeight: fontWeight?? FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
