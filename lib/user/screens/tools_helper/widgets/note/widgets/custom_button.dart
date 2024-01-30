import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../general/themes/app_colors.dart';
import '../../../../../../general/themes/cubit/app_theme_cubit.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    this.isLoading = false,
  });

  final void Function()? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // color: MyColors.white,
        width: MediaQuery.sizeOf(context).width,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: isLoading
              ? SizedBox(
                  height: 25,
                  width: 25,
                  child: const CircularProgressIndicator(
                    color: Colors.black,
                  ))
              : MyText(
                  title: tr(context, "add"),
                  color: context.watch<AppThemeCubit>().isDarkMode
                      ? MyColors.white
                      :MyColors.black100,
                  size: 20,
                  fontWeight: FontWeight.bold,
                ),
        ),
      ),
    );
  }
}
