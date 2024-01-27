import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/themes/app_colors.dart';
import 'package:expenses/general/themes/cubit/app_theme_cubit.dart';
import 'package:expenses/res.dart';
import 'package:expenses/user/models/add_transaction_model/add_transaction_model.dart';
import 'package:expenses/user/screens/reports/statistics/widgets/compare/compare_body.dart';
import 'package:expenses/user/screens/reports/statistics/widgets/compare/tabs_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../cubit/reports_cubit.dart';
import '../widgets/reports_widgets_imports.dart';

part 'statistics.dart';
part 'widgets/chart/report_chart.dart';
part 'widgets/compare/report_comparison.dart';
part 'widgets/statistics_body.dart';
part 'widgets/statistics_dropdown.dart';
part 'widgets/table/report_table.dart';
