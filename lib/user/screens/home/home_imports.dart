import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/generic_bloc/generic_cubit.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/utilities/routers/RouterImports.gr.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/general/widgets/widgets_imports.dart';
import 'package:expenses/res.dart';
import 'package:expenses/user/models/tab_model/tab_model.dart';
import 'package:expenses/user/screens/budget/budget_imports.dart';
import 'package:expenses/user/screens/database/database_imports.dart';
import 'package:expenses/user/screens/home/taps/main/main_imports.dart';
import 'package:expenses/user/screens/home/widgets/HomeWidgetsImports.dart';
import 'package:expenses/user/screens/reports/reports_imports.dart';
import 'package:expenses/user/screens/transactions/transactions_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'home.dart';
part 'home_data.dart';