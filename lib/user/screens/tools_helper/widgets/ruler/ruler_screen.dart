import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rulers/rulers.dart';

import '../../../../../general/themes/app_colors.dart';
import '../../../../../general/themes/cubit/app_theme_cubit.dart';

class RulerScreen extends StatefulWidget {
  @override
  _RulerScreenState createState() => _RulerScreenState();
}

class _RulerScreenState extends State<RulerScreen> {
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
        title: MyText(title: tr(context, "ruler"),  color:context.watch<AppThemeCubit>().isDarkMode
            ? MyColors.white
            :MyColors.black,
          size: 16.sp,fontWeight: FontWeight.bold,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                MyText(title: tr(context, "normalScale"), color:context.watch<AppThemeCubit>().isDarkMode
                    ? MyColors.white
                    :MyColors.black, size: 16.sp,fontWeight: FontWeight.bold,),
                Container(
                  margin: const EdgeInsets.only(top: 8.0),
                  child: RulerWidget(
                    height: 100,
                    scaleBackgroundColor: Colors.grey.shade200,
                    largeScaleBarsInterval: 100,
                    smallScaleBarsInterval: 5,
                    barsColor: Colors.grey,
                    indicatorWidget: Column(
                      children: <Widget>[
                        Icon(
                          Icons.arrow_drop_down,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: MyText(title: tr(context, "horizontalScale"),  color:context.watch<AppThemeCubit>().isDarkMode
                      ? MyColors.white
                      :MyColors.black, size: 16.sp,fontWeight: FontWeight.bold,),

                ),
                Container(
                  margin: const EdgeInsets.only(top: 8.0),
                  alignment: Alignment.centerLeft,
                  child: RulerWidget(
                    scaleBackgroundColor: Colors.grey.shade100,
                    height: 100,
                    indicatorWidget: Column(
                      children: <Widget>[
                        Icon(
                          Icons.arrow_drop_down,
                          color: Colors.red,
                        ),
                      ],
                    ),
                    largeScaleBarsInterval: 20,
                    smallScaleBarsInterval: 4,
                    lowerIndicatorLimit: 0,
                    lowerMidIndicatorLimit: 0,
                    upperMidIndicatorLimit: 0,
                    upperIndicatorLimit: 0,
                    barsColor: Colors.grey,
                    inRangeBarColor: Colors.green,
                    behindRangeBarColor: Colors.orangeAccent,
                    outRangeBarColor: Colors.red,
                    axis: Axis.vertical,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
