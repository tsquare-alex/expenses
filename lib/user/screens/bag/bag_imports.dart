import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/constants/custom_%20drop_down/CustomDropDown.dart';
import 'package:expenses/general/models/bag_model/bag_model.dart';
import 'package:expenses/general/packages/generic_bloc/generic_cubit.dart';
import 'package:expenses/general/utilities/routers/RouterImports.gr.dart';
import 'package:expenses/general/utilities/utils_functions/LoadingDialog.dart';
import 'package:expenses/user/models/dropdown_model/dropdown_model.dart';
import 'package:expenses/user/screens/bag/widgets/bag_widgets_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

part 'bag_data.dart';
part 'bag.dart';