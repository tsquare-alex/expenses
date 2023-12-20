import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildToolsWidget extends StatelessWidget {
  const BuildToolsWidget({
    super.key, required this.title, this.onTap, required this.icon,
  });
  final String title;
  final void Function()? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon,color: MyColors.primary,),
          const SizedBox(width: 15,),
          MyText(title: tr(context, title), color: MyColors.primary, size: 15.sp,fontWeight: FontWeight.bold,),
        ],
      ),
    );
  }
}