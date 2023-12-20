part of '../statistics_imports.dart';

class StatisticsBody extends StatelessWidget {
  const StatisticsBody({
    Key? key,
    required this.option,
  }) : super(key: key);

  final String option;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.r),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                flex: 3,
                child: ChoiceSection(label: 'اختيار المحفظة', onTap: () {}),
              ),
              Flexible(
                flex: 2,
                child: ChoiceSection(label: 'المدة من', onTap: () {}),
              ),
            ],
          ),
          Row(
            children: [
              Flexible(
                flex: 3,
                child: ChoiceSection(label: 'اختيار المعاملة', onTap: () {}),
              ),
              Flexible(
                flex: 2,
                child: ChoiceSection(label: 'المدة إلى', onTap: () {}),
              ),
            ],
          ),
          Row(
            children: [
              Flexible(
                  flex: 3,
                  child: ChoiceSection(
                      label: 'اختيار المعاملة الفرعية', onTap: () {})),
              Flexible(
                flex: 2,
                child: ChoiceSection(label: 'تحديد الأولوية', onTap: () {}),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              10.r,
              10.r,
              10.r,
              0.r,
            ),
            child: SizedBox(
              height: 40.h,
              width: 0.25.sw,
              child: ElevatedButton(
                onPressed: () {
                  ReportsCubit.get(context).showDetails();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.watch<AppThemeCubit>().isDarkMode
                      ? AppDarkColors.primary
                      : MyColors.primary,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Text(
                  'استعراض',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: BlocBuilder<ReportsCubit, ReportsState>(
              builder: (context, state) {
                if (state is ShowReportDetails) {
                  return switch (option) {
                    'table' => const ReportTable(),
                    'chart' => const ReportChart(),
                    'compare' => const ReportComparison(),
                    String _ => const ReportTable(),
                  };
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
