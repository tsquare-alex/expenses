import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/themes/app_colors.dart';
import 'package:expenses/general/themes/cubit/app_theme_cubit.dart';
import 'package:expenses/general/utilities/routers/RouterImports.gr.dart';
import 'package:expenses/general/utilities/utils_functions/LoadingDialog.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/res.dart';
import 'package:expenses/user/screens/reports/cubit/reports_cubit.dart';
import 'package:expenses/user/screens/reports/models/reports_category.dart';
import 'package:expenses/user/screens/reports/reports_imports.dart';
import 'package:expenses/user/screens/reports/widgets/table_row_cell.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xcel;


part 'field_section.dart';
part 'date_field.dart';
part 'options_button.dart';
part 'circular_details_row.dart';
part 'circular_percentage.dart';
part 'reports_body.dart';
part 'save_share_buttons.dart';
part 'no_record.dart';
