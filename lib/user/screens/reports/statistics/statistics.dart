part of 'statistics_imports.dart';

class Statistics extends StatelessWidget {
  final String option;
  const Statistics({
    Key? key,
    required this.option,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(
          title: 'تفاصيل التقرير',
          color: MyColors.white,
          size: 16.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: BlocProvider(
        create: (context) => ReportsCubit(),
        child:  StatisticsBody(option: option),
      ),
    );
  }
}
