part of 'reports_widgets_imports.dart';

class CircularPercentage extends StatelessWidget {
  const CircularPercentage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      animationDuration: 1000,
      radius: 65.r,
      lineWidth: 22.r,
      startAngle: 0,
      animation: true,
      percent: context.watch<ReportsCubit>().circleChartPercentage,
      center: Text(
        NumberFormat.percentPattern()
            .format(context.watch<ReportsCubit>().circleChartPercentage),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.sp,
        ),
      ),
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: Colors.red,
      backgroundColor: Colors.yellowAccent,
    );
  }
}
