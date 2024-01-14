part of 'reports_widgets_imports.dart';

class CircularPercentage extends StatelessWidget {
  const CircularPercentage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      animationDuration: 1000,
      radius: 130.r,
      lineWidth: 30.r,
      startAngle: 0,
      animation: true,
      percent: context.watch<ReportsCubit>().circleChartPercentage,
      center: Text(
        NumberFormat.percentPattern('en')
            .format(context.watch<ReportsCubit>().circleChartPercentage),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 32.sp,
        ),
      ),
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: MyColors.primary,
      backgroundColor: Colors.grey.shade100,
    );
  }
}
