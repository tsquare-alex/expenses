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
        backgroundColor: context.watch<AppThemeCubit>().isDarkMode
            ? AppDarkColors.backgroundColor
            : Colors.white,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              Res.reports,
              width: 24.w,
              height: 24.h,
              color: context.watch<AppThemeCubit>().isDarkMode
                  ? AppDarkColors.secondary
                  : MyColors.primary,
            ),
            SizedBox(
              width: 8.w,
            ),
            Text(
              tr(context, 'reportDetails'),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
                color: context.watch<AppThemeCubit>().isDarkMode
                    ? MyColors.white
                    : MyColors.black,
              ),
            ),
          ],
        ),
        leading: GestureDetector(
          onTap: () => AutoRouter.of(context).pop(),
          child: Icon(
            Icons.arrow_back,
            color: context.watch<AppThemeCubit>().isDarkMode
                ? MyColors.white
                : MyColors.black,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => ReportsCubit()..getStatsData(),
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
