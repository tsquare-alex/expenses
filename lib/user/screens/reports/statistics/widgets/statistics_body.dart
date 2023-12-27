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
                child: ChoiceSection(
                  label: tr(context, 'chooseWallet'),
                  menuList: context.watch<ReportsCubit>().selectedWalletsMap,
                  onSelect: (key) =>
                      ReportsCubit.get(context).onWalletMapSelect(key),
                ),
              ),
              Flexible(
                flex: 2,
                child: GestureDetector(
                  onTap: () async {
                    ReportsCubit.get(context).statsSelectedDateFrom =
                        await showDatePicker(
                      context: context,
                      initialEntryMode: DatePickerEntryMode.calendarOnly,
                      initialDate:
                          ReportsCubit.get(context).statsSelectedDateFrom!,
                      firstDate:
                          DateTime.now().subtract(const Duration(days: 30)),
                      lastDate: DateTime.now().add(
                        const Duration(days: 365),
                      ),
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: ColorScheme.light(
                              primary: context.watch<AppThemeCubit>().isDarkMode
                                  ? AppDarkColors.primary
                                  : MyColors.primary,
                              onSurface:
                                  context.watch<AppThemeCubit>().isDarkMode
                                      ? AppDarkColors.primary
                                      : MyColors.primary,
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );
                    if (context.mounted) {
                      ReportsCubit.get(context).changeStatsDateFrom();
                    }
                  },
                  child: FieldSection(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          context
                                  .watch<ReportsCubit>()
                                  .statsFormattedDateFrom
                                  .isEmpty
                              ? tr(context, 'durationFrom')
                              : context
                                  .watch<ReportsCubit>()
                                  .statsFormattedDateFrom,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Flexible(
                flex: 3,
                child: ChoiceSection(
                  label: 'اختيار المعاملة',
                  menuList: context.watch<ReportsCubit>().statsTransactionsMap,
                  onSelect: (key) =>
                      ReportsCubit.get(context).onTransactionsMapSelect(key),
                ),
              ),
              Flexible(
                flex: 2,
                child: GestureDetector(
                  onTap: () async {
                    ReportsCubit.get(context).statsSelectedDateTo =
                        await showDatePicker(
                      context: context,
                      initialEntryMode: DatePickerEntryMode.calendarOnly,
                      initialDate:
                          ReportsCubit.get(context).statsSelectedDateTo,
                      firstDate:
                          ReportsCubit.get(context).statsSelectedDateFrom!,
                      lastDate: DateTime.now().add(
                        const Duration(days: 365),
                      ),
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: ColorScheme.light(
                              primary: context.watch<AppThemeCubit>().isDarkMode
                                  ? AppDarkColors.primary
                                  : MyColors.primary,
                              onSurface:
                                  context.watch<AppThemeCubit>().isDarkMode
                                      ? AppDarkColors.primary
                                      : MyColors.primary,
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );
                    if (context.mounted) {
                      ReportsCubit.get(context).changeStatsDateTo();
                    }
                  },
                  child: FieldSection(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          context
                                  .watch<ReportsCubit>()
                                  .statsFormattedDateTo
                                  .isEmpty
                              ? tr(context, 'durationTo')
                              : context
                                  .watch<ReportsCubit>()
                                  .statsFormattedDateTo,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Flexible(
                flex: 3,
                child: ChoiceSection(
                  label: 'اختيار المعاملة الفرعية',
                  menuList:
                      context.watch<ReportsCubit>().statsSubTransactionsMap,
                  onSelect: (key) =>
                      ReportsCubit.get(context).onSubTransactionsMapSelect(key),
                ),
              ),
              Flexible(
                flex: 2,
                child: ChoiceSection(
                  label: 'تحديد الأولوية',
                  menuList: context.watch<ReportsCubit>().statsPrioritiesMap,
                  onSelect: (key) =>
                      ReportsCubit.get(context).onPrioritiesMapSelect(key),
                ),
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
              buildWhen: (previous, current) => current is ShowReportDetails,
              builder: (context, state) {
                if (state is ShowReportDetails) {
                  return switch (option) {
                    'table' => ReportTable(
                        data: ReportsCubit.get(context).filteredTransactions),
                    'chart' => Center(
                        child: Text(
                          'قيد التطوير حاليا',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    'compare' => Center(
                        child: Text(
                          'قيد التطوير حاليا',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    String _ => ReportTable(
                        data: ReportsCubit.get(context).filteredTransactions),
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
