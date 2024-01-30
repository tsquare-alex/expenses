import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/themes/cubit/app_theme_cubit.dart';
import 'package:expenses/general/utilities/routers/RouterImports.gr.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderLogo extends StatelessWidget {
  final double? topPadding;
  final double? width;
  final double? height;
  final Color? color;
  final String? image;

  const HeaderLogo({Key? key, this.topPadding, this.color, this.image, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
        top: topPadding ?? 0,
        right: 50,
        left: 50,
        bottom: 20,
      ),
      child: Image(
        color: color,
        height: width??MediaQuery.of(context).size.height * 0.18,
        width: height??MediaQuery.of(context).size.width * 0.55,
        image: AssetImage(image??Res.logo),
        fit: BoxFit.contain,
      ),
    );
  }
}
