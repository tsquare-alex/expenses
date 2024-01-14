import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClothesSizeScreen extends StatelessWidget {
  const ClothesSizeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        centerTitle: true,
        title: MyText(title: tr(context, "clothesSize"), color: Colors.white, size: 15.sp,fontWeight: FontWeight.bold,),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyText(title: tr(context, "clothesSizeMen"), color: MyColors.primary, size: 18.sp),
            Image.asset(Res.mensize),
            MyText(title:  tr(context, "clothesSizeWomen"), color: MyColors.primary, size: 18.sp),
            Image.asset(Res.womensize),
            Image.asset(Res.pantSize),
          ],
        ),
      ),
    );
  }
}
