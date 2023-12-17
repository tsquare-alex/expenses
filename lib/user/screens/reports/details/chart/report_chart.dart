part of '../reports_details_imports.dart';

class ReportChart extends StatelessWidget {
  const ReportChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.r),
          child: BarChart(
            expenses: ReportsData().weeklySpending,
          ),
        ),
      ),
    );
  }
}
