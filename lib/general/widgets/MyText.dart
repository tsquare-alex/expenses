import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:expenses/general/helper/configration/DecorationUtils.dart';

class MyText extends StatelessWidget {
  final String title;
  final Color? color;
  final double? size;
  final String? fontFamily;
  final TextAlign? alien;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  final double? textScaleFactor;
  final int? max;

  const MyText({
    Key? key,
    required this.title,
    required this.color,
    required this.size,
    this.alien,
    this.fontFamily,
    this.decoration,
    this.overflow,
    this.fontWeight,
    this.textScaleFactor,
    this.max,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: alien ?? TextAlign.start,
      textScaleFactor: textScaleFactor ?? 1.2,
      maxLines: max,
      style: TextStyle(
          color: color ?? Colors.black,
          fontSize: size ?? 16,
          decoration: decoration ?? TextDecoration.none,
          fontWeight: fontWeight ??
              (DecorationUtils.lang == "ar"
                  ? FontWeight.w500
                  : FontWeight.w200),
          fontFamily: fontFamily ??
              (DecorationUtils.lang == "ar"
                  ? GoogleFonts.tajawal().fontFamily
                  : GoogleFonts.tajawal().fontFamily)),
      overflow: overflow,
    );
  }
}
