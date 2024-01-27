import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/user/models/add_transaction_model/add_transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CompareChart extends StatelessWidget {
  const CompareChart({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<AddTransactionModel> data;

  @override
  Widget build(BuildContext context) {
    List<_CompareChartData> chartData = data
        .map(
          (transaction) => _CompareChartData(
              transaction.transactionDate!, transaction.total!),
        )
        .toList();
    return SizedBox(
      height: 0.4.sh,
      child: SfCartesianChart(
        primaryXAxis: DateTimeCategoryAxis(
          dateFormat: DateFormat('EE dd/MM'),
          intervalType: DateTimeIntervalType.days,
          interval: 1,
          labelRotation: 90,
          isInversed: true,
        ),
        primaryYAxis: NumericAxis(),
        series: <CartesianSeries<_CompareChartData, DateTime>>[
          ColumnSeries<_CompareChartData, DateTime>(
            animationDuration: 500,
            dataSource: chartData,
            xValueMapper: (_CompareChartData chartData, _) =>
                DateFormat('dd/MM/yyyy').parse(chartData.x),
            yValueMapper: (_CompareChartData chartData, _) =>
                int.tryParse(chartData.y),
            width: 0.25,
            color: MyColors.primary,
          ),
        ],
      ),
    );
  }
}

class _CompareChartData {
  _CompareChartData(this.x, this.y);

  final String x;
  final String y;
}
