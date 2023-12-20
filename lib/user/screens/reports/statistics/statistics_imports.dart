import 'dart:ui';

import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/themes/app_colors.dart';
import 'package:expenses/general/themes/cubit/app_theme_cubit.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/user/screens/reports/reports_imports.dart';
import 'package:expenses/user/screens/reports/statistics/widgets/chart/bar_chart.dart';
// import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../cubit/reports_cubit.dart';
import '../widgets/reports_widgets_imports.dart';

part 'statistics.dart';
part 'widgets/chart/report_chart.dart';
part 'widgets/table/report_table.dart';
part 'widgets/compare/report_comparison.dart';
part 'widgets/statistics_body.dart';
part 'widgets/choice_section.dart';
