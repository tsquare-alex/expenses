part of 'reports_widgets_imports.dart';

class CircularPercentage extends StatelessWidget {
  const CircularPercentage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showReportOptionsModalSheet(context: context),
      child: CircularPercentIndicator(
        animationDuration: 1000,
        radius: 65.r,
        lineWidth: 22.r,
        startAngle: 0,
        animation: true,
        percent: ReportsCubit.get(context).circleChartPercentage,
        center: Text(
          NumberFormat.percentPattern()
              .format(ReportsCubit.get(context).circleChartPercentage),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
          ),
        ),
        circularStrokeCap: CircularStrokeCap.round,
        progressColor: Colors.red,
        backgroundColor: Colors.yellowAccent,
      ),
    );
  }
}
