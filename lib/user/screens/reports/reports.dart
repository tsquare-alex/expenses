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
          backgroundColor: MyColors.white,
          centerTitle: true,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                Res.reports,
                width: 24.w,
                height: 24.h,
                color: MyColors.primary,
              ),
              SizedBox(
                width: 8.w,
              ),
              MyText(
                title: tr(context, 'reports'),
                color: Colors.black,
                size: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          leading: GestureDetector(
            onTap: () => AutoRouter.of(context).pop(),
            child: Icon(
              Icons.arrow_back,
              color: MyColors.black,
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
                      color: MyColors.primary,
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
