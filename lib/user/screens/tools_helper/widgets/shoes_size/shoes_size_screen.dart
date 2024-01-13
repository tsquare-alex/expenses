import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShoesSizeScreen extends StatelessWidget {
  const ShoesSizeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        centerTitle: true,
        title: MyText(title: tr(context, "shoesSize"), color: Colors.white, size: 15.sp,fontWeight: FontWeight.bold,),
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
