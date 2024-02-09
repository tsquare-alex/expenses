import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../general/themes/cubit/app_theme_cubit.dart';

class BuildToolsWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  // final IconData icon; // Add this line
  final String image;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;
  final String? imagePro;

  const BuildToolsWidget({
    required this.onTap,
    required this.title,
    required this.image, // Add this line
    required this.isFavorite,
    required this.onFavoriteTap, this.imagePro,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Image.asset(image),
          ),
           SizedBox(width: 10.w),
          MyText(
            title: tr(context, title),
            color:context.watch<AppThemeCubit>().isDarkMode ? MyColors.white : MyColors.black,
            size: 16,
            // fontWeight: FontWeight.bold,
          ),
           // SizedBox(width: 80.w),
          Spacer(),
          imagePro != null ? Image.asset(imagePro!,width: 40.w,) : SizedBox(),

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
