part of '../../statistics_imports.dart';

class ReportChart extends StatelessWidget {
  const ReportChart({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<AddTransactionModel> data;

  @override
  Widget build(BuildContext context) {
    List<_ChartData> chartData = data
        .map(
          (transaction) =>
              _ChartData(transaction.transactionDate!, transaction.total!),
        )
        .toList();
    return SizedBox(
      height: 0.4.sh,
      child: SfCartesianChart(
        primaryXAxis: DateTimeCategoryAxis(
          dateFormat: DateFormat('EE dd/MM'),
          intervalType: DateTimeIntervalType.days,
          interval: 1,
          labelRotation: -90,
          isInversed: true,
        ),
        primaryYAxis: NumericAxis(),
        series: <CartesianSeries<_ChartData, DateTime>>[
          ColumnSeries<_ChartData, DateTime>(
            animationDuration: 500,
            dataSource: chartData,
            xValueMapper: (_ChartData chartData, _) =>
                DateFormat('dd/MM/yyyy').parse(chartData.x),
            yValueMapper: (_ChartData chartData, _) =>
                int.tryParse(chartData.y),
            width: 0.25,
            color: MyColors.primary,
          ),
        ],
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final String y;
}
