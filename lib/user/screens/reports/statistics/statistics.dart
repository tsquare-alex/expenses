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
        backgroundColor: MyColors.white,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 64.r),
          child: Row(
            children: [
              Image.asset(
                Res.chart,
                width: 24.w,
                height: 24.h,
                color: MyColors.primary,
              ),
              SizedBox(
                width: 8.w,
              ),
              MyText(
                title: tr(context, 'reportDetails'),
                color: Colors.black,
                size: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
        leadingWidth: 48.w,
        leading: GestureDetector(
          onTap: () => AutoRouter.of(context).pop(),
          child: Icon(
            Icons.arrow_back,
            color: MyColors.black,
          ),
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
