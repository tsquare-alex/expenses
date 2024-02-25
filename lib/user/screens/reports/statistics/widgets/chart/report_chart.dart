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
        .asMap()
        .entries
        .map(
          (entry) => _ChartData(
            entry.value.transactionDate!,
            entry.value.total!,
            ReportsCubit.get(context).randomColors[entry.key],
            entry.value.transactionContent!.name!,
          ),
        )
        .toList();
    return SizedBox(
      height: 0.4.sh,
      child: SfCartesianChart(
        key: ReportsCubit.get(context).cartesianChartKey,
        primaryXAxis: DateTimeCategoryAxis(
          dateFormat: DateFormat('EE dd/MM'),
          intervalType: DateTimeIntervalType.days,
          interval: 1,
          labelRotation: 90,
          isInversed: true,
        ),
        primaryYAxis: NumericAxis(),
        series: <CartesianSeries<_ChartData, DateTime>>[
          ColumnSeries<_ChartData, DateTime>(
            dataLabelMapper: (_ChartData chartData, _) =>
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
            enableTooltip: true,
            animationDuration: 500,
            dataSource: chartData,
            xValueMapper: (_ChartData chartData, _) =>
                DateFormat('dd/MM/yyyy').parse(chartData.x),
            yValueMapper: (_ChartData chartData, _) =>
                int.tryParse(chartData.y),
            pointColorMapper: (_ChartData chartData, _) => chartData.color,
          ),
        ],
      ),
    );
  }
}

class _ChartData {
  _ChartData(
    this.x,
    this.y,
    this.color,
    this.name,
  );

  final String x;
  final String y;
  final Color color;
  final String name;
}
