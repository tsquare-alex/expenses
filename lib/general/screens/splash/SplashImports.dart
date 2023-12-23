import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/helper/configration/InitUtils.dart';
import 'package:expenses/general/helper/storage/Storage.dart';
import 'package:expenses/general/models/user_model/user_model.dart';
import 'package:expenses/general/packages/animation_container/AnimationContainer.dart';
import 'package:expenses/general/themes/app_colors.dart';
import 'package:expenses/general/themes/cubit/app_theme_cubit.dart';
import 'package:expenses/general/utilities/routers/RouterImports.gr.dart';
import 'package:expenses/general/utilities/utils_functions/ApiNames.dart';
import 'package:expenses/general/utilities/utils_functions/utils.dart';
import 'package:expenses/res.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'Splash.dart';
part 'SplashData.dart';