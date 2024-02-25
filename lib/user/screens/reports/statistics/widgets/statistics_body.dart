part of '../statistics_imports.dart';

class StatisticsBody extends StatelessWidget {
  const StatisticsBody({
    Key? key,
    required this.option,
  }) : super(key: key);

  final String option;

  @override
  Widget build(BuildContext context) {
    return (option == 'table' || option == 'chart')
        ? SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h),
                if (option == 'table')
                  Text(
                    tr(context, 'showTable'),
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                if (option == 'chart')
                  Text(
                    tr(context, 'showChart'),
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                SizedBox(height: 16.h),
                StatisticsDropdown(
                  label: tr(context, 'chooseWallet'),
                  choice: ReportsCubit.get(context).statsSelectedWallet,
                  menuList: ReportsCubit.get(context)
                      .wallets
                      .map(
                        (wallet) => DropdownMenuItem<String>(
                          value: wallet.name,
                          child: Text(
                            wallet.name,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: context.watch<AppThemeCubit>().isDarkMode
                                  ? Colors.white
                                  : Colors.black54,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  onSelect: (value) =>
                      ReportsCubit.get(context).onWalletSelect(value),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 7.h, horizontal: 14.w),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.solidCalendarDays,
                            size: 22.r,
                            color: context.watch<AppThemeCubit>().isDarkMode
                                ? AppDarkColors.secondary
                                : MyColors.primary,
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
                            if (ReportsCubit.get(context)
                                    .beforeDatesFilteredTransactions
                                    .isEmpty ||
                                ReportsCubit.get(context)
                                    .statsSelectedWallet
                                    .isEmpty) {
                              return;
                            }
                            ReportsCubit.get(context).statsSelectedDateFrom =
                                await showDatePicker(
                              context: context,
                              initialEntryMode:
                                  DatePickerEntryMode.calendarOnly,
                              initialDate: ReportsCubit.get(context)
                                  .statsSelectedDateFrom!,
                              firstDate: DateTime.now()
                                  .subtract(const Duration(days: 365)),
                              lastDate: DateTime.now().add(
                                const Duration(days: 365),
                              ),
                              builder: (context, child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    colorScheme: context
                                            .watch<AppThemeCubit>()
                                            .isDarkMode
                                        ? ColorScheme.dark(
                                            primary: AppDarkColors.secondary,
                                            onSurface: AppDarkColors.secondary,
                                            surfaceTint: Colors.transparent,
                                          )
                                        : ColorScheme.light(
                                            primary: MyColors.primary,
                                            onSurface: MyColors.primary,
                                            surfaceTint: Colors.transparent,
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
                                    fontWeight: FontWeight.w700,
                                    color: context
                                            .watch<ReportsCubit>()
                                            .statsFormattedDateFrom
                                            .isEmpty
                                        ? Colors.grey
                                        : context
                                                .watch<AppThemeCubit>()
                                                .isDarkMode
                                            ? Colors.white
                                            : Colors.black54,
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color:
                                      context.watch<AppThemeCubit>().isDarkMode
                                          ? AppDarkColors.secondary
                                          : MyColors.primary,
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
                            if (ReportsCubit.get(context)
                                    .beforeDatesFilteredTransactions
                                    .isEmpty ||
                                ReportsCubit.get(context)
                                    .statsFormattedDateFrom
                                    .isEmpty) {
                              return;
                            }
                            ReportsCubit.get(context).statsSelectedDateTo =
                                await showDatePicker(
                              context: context,
                              initialEntryMode:
                                  DatePickerEntryMode.calendarOnly,
                              initialDate:
                                  ReportsCubit.get(context).statsSelectedDateTo,
                              firstDate: ReportsCubit.get(context)
                                  .statsSelectedDateFrom!,
                              lastDate: DateTime.now().add(
                                const Duration(days: 365),
                              ),
                              builder: (context, child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    colorScheme: context
                                            .watch<AppThemeCubit>()
                                            .isDarkMode
                                        ? ColorScheme.dark(
                                            primary: AppDarkColors.secondary,
                                            onSurface: AppDarkColors.secondary,
                                            surfaceTint: Colors.transparent,
                                          )
                                        : ColorScheme.light(
                                            primary: MyColors.primary,
                                            onSurface: MyColors.primary,
                                            surfaceTint: Colors.transparent,
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
                                    fontWeight: FontWeight.w700,
                                    color: context
                                            .watch<ReportsCubit>()
                                            .statsFormattedDateTo
                                            .isEmpty
                                        ? Colors.grey
                                        : context
                                                .watch<AppThemeCubit>()
                                                .isDarkMode
                                            ? Colors.white
                                            : Colors.black54,
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color:
                                      context.watch<AppThemeCubit>().isDarkMode
                                          ? AppDarkColors.secondary
                                          : MyColors.primary,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                StatisticsDropdown(
                  label: tr(context, 'chooseTransaction'),
                  choice: ReportsCubit.get(context).statsSelectedTransaction,
                  menuList: context
                      .watch<ReportsCubit>()
                      .statsTransactions
                      .map(
                        (transaction) => DropdownMenuItem<String>(
                          value: transaction,
                          child: Text(
                            tr(context, transaction).isEmpty
                                ? transaction
                                : tr(context, transaction),
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: context.watch<AppThemeCubit>().isDarkMode
                                  ? Colors.white
                                  : Colors.black54,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  onSelect: (value) =>
                      ReportsCubit.get(context).onTransactionsSelect(value),
                ),
                SizedBox(height: 20.h),
                StatisticsDropdown(
                  label: tr(context, 'chooseSubTransaction'),
                  choice: ReportsCubit.get(context).statsSelectedSubTransaction,
                  menuList: ReportsCubit.get(context)
                      .statsSubTransactions
                      .map(
                        (transaction) => DropdownMenuItem<String>(
                          value: transaction,
                          child: Text(
                            tr(context, transaction).isEmpty
                                ? transaction
                                : tr(context, transaction),
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: context.watch<AppThemeCubit>().isDarkMode
                                  ? Colors.white
                                  : Colors.black54,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  onSelect: (value) =>
                      ReportsCubit.get(context).onSubTransactionsSelect(value),
                ),
                SizedBox(height: 20.h),
                StatisticsDropdown(
                  label: tr(context, 'setPriority'),
                  choice: ReportsCubit.get(context).statsSelectedPriorities,
                  menuList: ReportsCubit.get(context)
                      .statsPriorities
                      .map(
                        (transaction) => DropdownMenuItem<String>(
                          value: transaction,
                          child: Text(
                            tr(context, transaction).isEmpty
                                ? transaction
                                : tr(context, transaction),
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: context.watch<AppThemeCubit>().isDarkMode
                                  ? Colors.white
                                  : Colors.black54,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  onSelect: (value) =>
                      ReportsCubit.get(context).onPrioritiesSelect(value),
                ),
                SizedBox(height: 32.h),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          ReportsCubit.get(context).showDetails(context);
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(322.w, 58.h),
                          backgroundColor:
                              context.watch<AppThemeCubit>().isDarkMode
                                  ? AppDarkColors.primary
                                  : MyColors.primary,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        child: Text(
                          tr(context, 'showResults'),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox.square(dimension: 12.r),
                    OutlinedButton(
                      onPressed: () {
                        switch (AppThemeCubit.get(context).saveMethod) {
                          case 'excel':
                            switch (option) {
                              case 'table':
                                ReportsCubit.get(context)
                                    .generateAndShareStatsTableExcel(
                                        context: context);
                              case 'chart':
                                ReportsCubit.get(context)
                                    .generateAndShareStatsChartExcel(
                                        context: context);
                            }
                          case 'pdf':
                            switch (option) {
                              case 'table':
                                ReportsCubit.get(context)
                                    .generateAndShareStatsTablePDF(
                                        context: context);
                              case 'chart':
                                ReportsCubit.get(context)
                                    .generateAndShareStatsChartPDF(
                                        context: context);
                            }
                        }
                      },
                      style: OutlinedButton.styleFrom(
                        fixedSize: Size(64.w, 58.h),
                        elevation: 0,
                        side: BorderSide(
                          color: context.watch<AppThemeCubit>().isDarkMode
                              ? AppDarkColors.primary
                              : MyColors.primary,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                      ),
                      child: Image.asset(
                        Res.shareIcon,
                        color: context.watch<AppThemeCubit>().isDarkMode
                            ? AppDarkColors.secondary
                            : MyColors.primary,
                        height: 24,
                        width: 24,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32.h),
                BlocBuilder<ReportsCubit, ReportsState>(
                  builder: (context, state) {
                    if (state is ShowReportDetails) {
                      return switch (option) {
                        'table' => ReportTable(
                            data: ReportsCubit.get(context).filteredTransactions
                              ..sort(
                                (a, b) => DateFormat('dd/MM/yyyy', 'en')
                                    .parse(b.transactionDate!)
                                    .compareTo(DateFormat('dd/MM/yyyy', 'en')
                                        .parse(a.transactionDate!)),
                              ),
                          ),
                        'chart' => ReportChart(
                            data: ReportsCubit.get(context).filteredTransactions
                              ..sort(
                                (a, b) => DateFormat('dd/MM/yyyy', 'en')
                                    .parse(a.transactionDate!)
                                    .compareTo(DateFormat('dd/MM/yyyy', 'en')
                                        .parse(b.transactionDate!)),
                              ),
                          ),
                        String _ => ReportTable(
                            data: ReportsCubit.get(context).filteredTransactions
                              ..sort(
                                (a, b) => DateFormat('dd/MM/yyyy', 'en')
                                    .parse(b.transactionDate!)
                                    .compareTo(DateFormat('dd/MM/yyyy', 'en')
                                        .parse(a.transactionDate!)),
                              ),
                          ),
                      };
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
                SizedBox(height: 20.h),
              ],
            ),
          )
        : const CompareBody();
  }
}
