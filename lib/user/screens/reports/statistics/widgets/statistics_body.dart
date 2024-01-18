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
      padding: EdgeInsets.symmetric(horizontal: 16.r),
      child: Column(
        children: [
          SizedBox(height: 16.h),
          ChoiceSection(
            label: tr(context, 'chooseWallet'),
            menuList: context.watch<ReportsCubit>().selectedWalletsMap,
            onSelect: (key) => ReportsCubit.get(context).onWalletMapSelect(key),
          ),
          SizedBox(height: 20.h),
          ChoiceSection(
            label: tr(context, 'chooseTransaction'),
            menuList: context.watch<ReportsCubit>().statsTransactionsMap,
            onSelect: (key) =>
                ReportsCubit.get(context).onTransactionsMapSelect(key),
          ),
          SizedBox(height: 20.h),
          ChoiceSection(
            label: tr(context, 'chooseSubTransaction'),
            menuList: context.watch<ReportsCubit>().statsSubTransactionsMap,
            onSelect: (key) =>
                ReportsCubit.get(context).onSubTransactionsMapSelect(key),
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Column(
                children: [
                  FaIcon(
                    FontAwesomeIcons.solidCalendarDays,
                    size: 20,
                    color: MyColors.primary,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    tr(context, 'chooseDuration'),
                    style: TextStyle(
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 11.w),
              Flexible(
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
                              background: Colors.white,
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
                              ? tr(context, 'from')
                              : context
                                  .watch<ReportsCubit>()
                                  .statsFormattedDateFrom,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: MyColors.primary,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.sp),
              Flexible(
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
                              ? tr(context, 'to')
                              : context
                                  .watch<ReportsCubit>()
                                  .statsFormattedDateTo,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: MyColors.primary,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          ChoiceSection(
            label: tr(context, 'setPriority'),
            menuList: context.watch<ReportsCubit>().statsPrioritiesMap,
            onSelect: (key) =>
                ReportsCubit.get(context).onPrioritiesMapSelect(key),
          ),
          SizedBox(height: 32.h),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  ReportsCubit.get(context).showDetails();
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(322.w, 58.h),
                  backgroundColor: context.watch<AppThemeCubit>().isDarkMode
                      ? AppDarkColors.primary
                      : MyColors.primary,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: Text(
                  tr(context, 'show'),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox.square(dimension: 12.r),
              OutlinedButton(
                onPressed: () {
                  CustomToast.showSimpleToast(msg: 'قيد التطوير حاليا');
                },
                style: OutlinedButton.styleFrom(
                  fixedSize: Size(64.w, 58.h),
                  // backgroundColor: context.watch<AppThemeCubit>().isDarkMode
                  //     ? AppDarkColors.primary
                  //     : MyColors.primary,
                  elevation: 0,
                  side: BorderSide(color: MyColors.primary),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                ),
                child: Icon(
                  Icons.share_outlined,
                  color: MyColors.primary,
                  size: 24.r,
                ),
              ),
            ],
          ),
          SizedBox(height: 32.h),
          BlocBuilder<ReportsCubit, ReportsState>(
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
        ],
      ),
    );
  }
}
