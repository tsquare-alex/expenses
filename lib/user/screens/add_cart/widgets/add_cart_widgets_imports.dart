import 'dart:typed_data';
import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/constants/custom_%20drop_down/DropDownTextField.dart';
import 'package:expenses/general/packages/generic_bloc/generic_cubit.dart';
import 'package:expenses/general/packages/input_fields/GenericTextField.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/widgets/DefaultButton.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/res.dart';
import 'package:expenses/user/models/cart_model/cart_content_model.dart';
import 'package:expenses/user/models/cart_model/cart_type_model.dart';
import 'package:expenses/user/screens/add_cart/add_cart_imports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'build_add_cart_inputs.dart';
part 'build_cart_type.dart';
part 'build_add_cart_type.dart';
part 'build_add_cart_content.dart';
part 'build_cart_date.dart';
part 'add_cart_button.dart';
part 'build_add_cart_product_photo.dart';
part 'build_implementation_alert.dart';