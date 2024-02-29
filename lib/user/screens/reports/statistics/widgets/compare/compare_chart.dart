import 'package:expenses/general/themes/cubit/app_theme_cubit.dart';
import 'package:expenses/user/models/add_transaction_model/add_transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../../general/packages/localization/Localizations.dart';
import '../../../cubit/reports_cubit.dart';

class CompareChart extends StatefulWidget {
  const CompareChart({
    Key? key,
    required this.data1,
    required this.data2,
  }) : super(key: key);

  final List<AddTransactionModel> data1;
  final List<AddTransactionModel> data2;

  @override
  State<CompareChart> createState() => _CompareChartState();
}

class _CompareChartState extends State<CompareChart> {
  @override
  Widget build(BuildContext context) {
    List<_CompareChartData> chartData1 =
        widget.data1.asMap().entries.map((entry) {
      return _CompareChartData(
        DateFormat('dd/MM/yyyy').parse(entry.value.transactionDate!),
        int.tryParse(entry.value.total!),
        null,
        ReportsCubit.get(context).randomColors[entry.key],
        entry.value.transactionContent!.name!,
      );
    }).toList();

    List<_CompareChartData> chartData2 =
        widget.data2.asMap().entries.map((entry) {
      return _CompareChartData(
        DateFormat('dd/MM/yyyy').parse(entry.value.transactionDate!),
        null,
        int.tryParse(entry.value.total!),
        ReportsCubit.get(context).randomColors.reversed.toList()[entry.key],
        entry.value.transactionContent!.name!,
      );
    }).toList();

    List<_CompareChartData> chartData = [...chartData1, ...chartData2];

    return SizedBox(
      height: 0.4.sh,
      child: SfCartesianChart(
        key: ReportsCubit.get(context).cartesianChartKey,
        primaryXAxis: DateTimeCategoryAxis(
          dateFormat: DateFormat('EE dd/MM'),
          intervalType: DateTimeIntervalType.days,
          interval: 1,
          labelRotation: 90,
        ),
        primaryYAxis: NumericAxis(),
        series: <CartesianSeries<_CompareChartData, DateTime>>[
          ColumnSeries<_CompareChartData, DateTime>(
            dataLabelMapper: (_CompareChartData chartData, _) =>
                tr(context, chartData.name),
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
              labelAlignment: ChartDataLabelAlignment.middle,
              angle: 90,
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            animationDuration: 500,
            dataSource: chartData,
            xValueMapper: (_CompareChartData chartData, _) => chartData.x,
            yValueMapper: (_CompareChartData chartData, _) => chartData.y1,
            pointColorMapper: (_CompareChartData chartData, _) =>
                chartData.color,
            sortFieldValueMapper: (_CompareChartData chartData, _) =>
                chartData.x,
            sortingOrder: SortingOrder.descending,
          ),
          ColumnSeries<_CompareChartData, DateTime>(
            dataLabelMapper: (_CompareChartData chartData, _) =>
                tr(context, chartData.name),
            dataLabelSettings: DataLabelSettings(
              isVisible: true,
              labelAlignment: ChartDataLabelAlignment.middle,
              angle: 90,
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: context.watch<AppThemeCubit>().isDarkMode
                    ? null
                    : Colors.black87,
              ),
            ),
            animationDuration: 500,
            dataSource: chartData,
            xValueMapper: (_CompareChartData chartData, _) => chartData.x,
            yValueMapper: (_CompareChartData chartData, _) => chartData.y2,
            pointColorMapper: (_CompareChartData chartData, _) =>
                chartData.color,
            sortFieldValueMapper: (_CompareChartData chartData, _) =>
                chartData.x,
            sortingOrder: SortingOrder.descending,
          ),
        ],
      ),
    );
  }
}

class _CompareChartData {
  _CompareChartData(
    this.x,
    this.y1,
    this.y2,
    this.color,
    this.name,
  );

  final DateTime x;
  final int? y1;
  final int? y2;
  final Color color;
  final String name;
}
