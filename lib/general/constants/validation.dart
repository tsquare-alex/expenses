import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:flutter/material.dart';

String? validateField(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'This field cannot be empty.';
  }
  return null;
}

String? validatePhoneField(String? value,BuildContext context)  {
  if (value == null || value.isEmpty) {
    return tr(context,"enterValue");
  }

  RegExp regex = RegExp(r'^[0-9]+$');
  if (!regex.hasMatch(value)) {
    return tr(context, "enterOnlyNumbers");
  }
  return null;
}
