part of '../../statistics_imports.dart';

class ReportChart extends StatelessWidget {
  const ReportChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.r),
        child: BarChart(
          expenses: ReportsCubit.get(context).weeklySpending,
        ),
      ),
    );
  }
}
