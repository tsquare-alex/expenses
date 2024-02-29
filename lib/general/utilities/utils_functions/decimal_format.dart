import 'package:expenses/general/themes/cubit/app_theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

extension DecimalFormatting on String {
  String formatToDecimal({required BuildContext context}) {
    String formattedNumber = this;

    switch (context.read<AppThemeCubit>().decimalValue) {
      case '0':
        formattedNumber = NumberFormat.decimalPattern()
            .format(double.tryParse(this)!.round());

      case '0.0':
        formattedNumber = NumberFormat('#,##0.0').format(double.tryParse(this));

      case '0.00':
        formattedNumber =
            NumberFormat('#,##0.00').format(double.tryParse(this));
    }

    return formattedNumber;
  }
}
