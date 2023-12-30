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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        title: Row(
          children: [
            Image.asset(
              Res.chart,
              width: 20.w,
              height: 20.h,
              color: MyColors.white,
            ),
            SizedBox(
              width: 10.w,
            ),
            MyText(
              title: tr(context, 'reports'),
              color: Colors.white,
              size: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: BlocProvider(
        create: (context) => ReportsCubit()..getReportData(context),
        child: BlocBuilder<ReportsCubit, ReportsState>(
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
