part of 'reports_imports.dart';

class Reports extends StatefulWidget {
  const Reports({
    Key? key,
  }) : super(key: key);

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  ReportsData data = ReportsData();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReportsCubit()..getReportData(),
      child: Scaffold(
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
                tr(context, 'reports'),
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
          actions: [
            BlocBuilder<ReportsCubit, ReportsState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => showReportOptionsModalSheet(context: context),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.r),
                    child: Image.asset(
                      Res.reportsMenu,
                      width: 24.w,
                      height: 24.h,
                      color: context.watch<AppThemeCubit>().isDarkMode
                          ? AppDarkColors.secondary
                          : MyColors.primary,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        body: BlocBuilder<ReportsCubit, ReportsState>(
          buildWhen: (previous, current) {
            return (previous == const ReportsState.reportDataLoading() ||
                current == const ReportsState.reportDataLoading());
          },
          builder: (context, state) {
            if (state is ReportDataLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: context.read<AppThemeCubit>().isDarkMode
                      ? AppDarkColors.primary
                      : MyColors.primary,
                ),
              );
            }
            if (state is ReportDataLoaded) {
              return ReportsBody(data: data);
            }
            return const Center(child: ReportNoRecord());
          },
        ),
      ),
    );
  }
}
