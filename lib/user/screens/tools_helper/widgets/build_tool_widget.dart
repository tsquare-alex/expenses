import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BuildToolsWidget extends StatelessWidget {
  const BuildToolsWidget({
    Key? key,
    required this.title,
    this.onTap,
    this.onFavoriteTap,
    required this.icon,
    required this.isFavorite,
  }) : super(key: key);

  final String title;
  final void Function()? onTap;
  final void Function()? onFavoriteTap;
  final IconData icon;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: MyColors.primary),
          const SizedBox(width: 15),
          MyText(
            title: tr(context, title),
            color: MyColors.primary,
            size: 15.sp,
            fontWeight: FontWeight.bold,
          ),
          Spacer(),
          IconButton(
            icon: Icon(
              isFavorite ? Icons.star : Icons.star_border,
              color: Colors.yellow,
            ),
            onPressed: onFavoriteTap,
          ),
        ],
      ),
    );
  }
}
