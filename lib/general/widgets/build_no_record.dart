import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/themes/cubit/app_theme_cubit.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildNoRecord extends StatelessWidget {
  const BuildNoRecord({Key? key, this.text}) : super(key: key);
  final String? text;
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
            height: 50.h,
          ),
          MyText(
            title: text??tr(context, "noRecord"),
            color: context.watch<AppThemeCubit>().isDarkMode
                ? MyColors.white
                : MyColors.black,
            size: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
