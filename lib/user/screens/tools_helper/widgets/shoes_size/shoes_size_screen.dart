import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../general/themes/app_colors.dart';
import '../../../../../general/themes/cubit/app_theme_cubit.dart';

class ShoesSizeScreen extends StatelessWidget {
  const ShoesSizeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => AutoRouter.of(context).pop(),
          child: Icon(
            Icons.arrow_back,
            color: context.watch<AppThemeCubit>().isDarkMode
                ? MyColors.white
                : MyColors.black,
          ),
        ),
        backgroundColor: context.watch<AppThemeCubit>().isDarkMode
            ? AppDarkColors.backgroundColor
            :MyColors.white,
        centerTitle: true,
        title: MyText(title: tr(context, "shoesSize"),  color:context.watch<AppThemeCubit>().isDarkMode
            ? MyColors.white
            :MyColors.black, size: 15.sp,fontWeight: FontWeight.bold,),
      ),
      body: SingleChildScrollView( 
        child: Column(
          children: [
            Image.asset(Res.women_shoes),
            const SizedBox(height: 15,),
            Image.asset(Res.men_shoes),
          ],
        ),
      ),
    );
  }
}
