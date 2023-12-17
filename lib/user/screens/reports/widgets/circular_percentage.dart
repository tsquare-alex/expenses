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
        startAngle: 340,
        animation: true,
        percent: 0.75,
        center: Text(
          '75%',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14.r,
          ),
        ),
        circularStrokeCap: CircularStrokeCap.round,
        progressColor: Colors.red,
        backgroundColor: Colors.yellowAccent,
      ),
    );
  }
}
