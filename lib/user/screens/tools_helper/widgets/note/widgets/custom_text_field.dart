import 'package:expenses/general/constants/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../general/themes/app_colors.dart';
import '../../../../../../general/themes/cubit/app_theme_cubit.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    this.maxLine = 1,
    this.onSaved, this.onChanged,
  }) : super(key: key);

  final String hintText;
  final int maxLine;
  final void Function(String?)? onSaved;
  final  Function(String?)? onChanged;

  // final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(

      onChanged: onChanged,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Field's can't be empty";
        } else {
          return null;
        }
      },
      onSaved: onSaved,
      cursorColor: MyColors.primary,
      maxLines: maxLine,
      decoration: InputDecoration(
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(MyColors.primary),
          errorBorder: buildBorder(Colors.red),
          hintText: hintText,
          hintStyle: TextStyle(
            color:context.watch<AppThemeCubit>().isDarkMode
                ? MyColors.white
                :MyColors.black100,
          )),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: color ??  MyColors.primary,
      ),
    );
  }
}
