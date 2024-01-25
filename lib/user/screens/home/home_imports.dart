import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/generic_bloc/generic_cubit.dart';
import 'package:expenses/local_notifications.dart';
import 'package:expenses/res.dart';
import 'package:expenses/user/models/tab_model/tab_model.dart';
import 'package:expenses/user/screens/budget/budget_imports.dart';
import 'package:expenses/user/screens/cart/cart_imports.dart';
import 'package:expenses/user/screens/database/database_imports.dart';
import 'package:expenses/user/screens/home/taps/main/main_imports.dart';
import 'package:expenses/user/screens/home/widgets/HomeWidgetsImports.dart';
import 'package:expenses/user/screens/repeated_transactions/repeated_transactions_imports.dart';
import 'package:expenses/user/screens/reports/reports_imports.dart';
import 'package:expenses/user/screens/settings/settings_imports.dart';
import 'package:expenses/user/screens/tools_helper/tools_helper.dart';
import 'package:expenses/user/screens/transactions/transactions_imports.dart';
import 'package:expenses/user/screens/wallet/wallet_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workmanager/workmanager.dart';

import '../../../general/themes/app_colors.dart';
import '../../models/favorite_model/favorite_model.dart';
import '../bmi_calculator/bmi_calculator_imports.dart';
import '../change_currency/change_currency_imports.dart';
import '../tools_helper/cubit/favorite_cubit.dart';
import '../tools_helper/favorite.dart';
import '../tools_helper/widgets/area_converter/area_converter.dart';
import '../tools_helper/widgets/bmr/bmr.dart';
import '../tools_helper/widgets/calculator/calculator_screen.dart';
import '../tools_helper/widgets/calender/calender_screen.dart';
import '../tools_helper/widgets/clothes_size/clothes_size_screen.dart';
import '../tools_helper/widgets/data_converter/data_converter.dart';
import '../tools_helper/widgets/discount/discount_screen.dart';
import '../tools_helper/widgets/length_converter/length_converter.dart';
import '../tools_helper/widgets/mass_converter/mass_converter.dart';
import '../tools_helper/widgets/percentage/percentage_screen.dart';
import '../tools_helper/widgets/qiblah/compass.dart';
import '../tools_helper/widgets/reminder/reminder.dart';
import '../tools_helper/widgets/ring_size/ring_size_screen.dart';
import '../tools_helper/widgets/ruler/ruler_screen.dart';
import '../tools_helper/widgets/scanner_qr_code/scanner_qr_code.dart';
import '../tools_helper/widgets/services_tax/service_tax_screen.dart';
import '../tools_helper/widgets/shoes_size/shoes_size_screen.dart';
import '../tools_helper/widgets/speed_converter/speed_converter.dart';
import '../tools_helper/widgets/temperature_converter/temperature_converter.dart';
import '../tools_helper/widgets/volume_converter/volume_converter.dart';

part 'home.dart';
part 'home_data.dart';
