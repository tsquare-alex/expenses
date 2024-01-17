import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/constants/custom_%20drop_down/CustomDropDown.dart';
import 'package:expenses/general/helper/AdaptivePicker.dart';
import 'package:expenses/general/packages/generic_bloc/generic_cubit.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/utilities/utils_functions/LoadingDialog.dart';
import 'package:expenses/general/utilities/utils_functions/utils.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/res.dart';
import 'package:expenses/user/models/cart_model/add_cart_model.dart';
import 'package:expenses/user/models/cart_model/cart_content_model.dart';
import 'package:expenses/user/models/cart_model/cart_model.dart';
import 'package:expenses/user/models/cart_model/cart_type_model.dart';
import 'package:expenses/user/models/radio_model/radio_model.dart';
import 'package:expenses/user/screens/add_cart/widgets/add_cart_widgets_imports.dart';
import 'package:expenses/user/screens/cart/cart_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

part 'add_cart.dart';
part 'add_cart_data.dart';