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
          title: tr(context, 'reportDetails'),
          color: MyColors.white,
          size: 16.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: BlocProvider(
        create: (context) => ReportsCubit()..getStatsData(context),
        child: BlocBuilder<ReportsCubit, ReportsState>(
          buildWhen: (previous, current) {
            return (previous == const ReportsState.statsDataLoading() ||
                current == const ReportsState.statsDataLoading());
          },
          builder: (context, state) {
            if (state is StatsDataLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: context.read<AppThemeCubit>().isDarkMode
                      ? AppDarkColors.primary
                      : MyColors.primary,
                ),
              );
            }
            if (state is StatsDataLoaded) {
              return StatisticsBody(option: option);
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
