import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RingSizeScreen extends StatelessWidget {
  const RingSizeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        centerTitle: true,
        title: MyText(title: tr(context, "ringSize"), color: Colors.white, size: 15.sp,fontWeight: FontWeight.bold,),
      ),
      body: Image.asset(Res.ring_size,fit: BoxFit.cover,),
    );
  }
}
