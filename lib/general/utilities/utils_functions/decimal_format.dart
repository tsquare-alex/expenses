import 'package:expenses/general/themes/cubit/app_theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

extension DecimalFormatting on String {
  String formatToDecimal({required BuildContext context}) {
    if (!context.read<AppThemeCubit>().enableDecimalFormatting) {
      return this;
    }
    String numberString = this;

    double number = double.tryParse(numberString) ?? 0.0;

    // String formattedNumber = number.toStringAsFixed(2);
    String formattedNumber = NumberFormat.decimalPattern().format(number);

    return formattedNumber;
  }
}
