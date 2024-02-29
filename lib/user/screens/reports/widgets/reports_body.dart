part of 'reports_widgets_imports.dart';

class ReportsBody extends StatelessWidget {
  const ReportsBody({
    super.key,
    required this.data,
  });

  final ReportsData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 16.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.r),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: FieldSection(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              isExpanded: true,
                              value: context
                                      .watch<ReportsCubit>()
                                      .selectedWallet
                                      .isEmpty
                                  ? null
                                  : context
                                      .watch<ReportsCubit>()
                                      .selectedWallet,
                              hint: Text(
                                tr(context, 'chooseSource'),
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      context.watch<AppThemeCubit>().isDarkMode
                                          ? Colors.white
                                          : Colors.grey,
                                ),
                              ),
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: context.watch<AppThemeCubit>().isDarkMode
                                    ? AppDarkColors.secondary
                                    : MyColors.primary,
                              ),
                              menuMaxHeight: 0.3.sh,
                              items: [
                                    DropdownMenuItem(
                                      value: 'all',
                                      child: Text(
                                        tr(context, 'all'),
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700,
                                          color: context
                                                  .watch<AppThemeCubit>()
                                                  .isDarkMode
                                              ? Colors.white
                                              : Colors.black54,
                                        ),
                                      ),
                                    )
                                  ] +
                                  ReportsCubit.get(context)
                                      .wallets
                                      .map(
                                        (wallet) => DropdownMenuItem(
                                          value: wallet.name,
                                          child: Text(
                                            wallet.name,
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w700,
                                              color: context
                                                      .watch<AppThemeCubit>()
                                                      .isDarkMode
                                                  ? Colors.white
                                                  : Colors.black54,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                              onChanged: (value) {
                                ReportsCubit.get(context).changeWallet(value!);
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 13.r),
                      Flexible(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () async {
                            // if (ReportsCubit.get(context)
                            //     .selectedWallet
                            //     .isEmpty) {
                            //   return;
                            // }
                            ReportsCubit.get(context).reportSelectedDate =
                                await showDateRangePicker(
                              context: context,
                              initialDateRange:
                                  ReportsCubit.get(context).reportInitialDate,
                              initialEntryMode:
                                  DatePickerEntryMode.calendarOnly,
                              firstDate: DateTime.now()
                                  .subtract(const Duration(days: 365)),
                              lastDate: DateTime.now().add(
                                const Duration(days: 365),
                              ),
                              builder: (context, child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    colorScheme: ColorScheme.light(
                                      primary: context
                                              .watch<AppThemeCubit>()
                                              .isDarkMode
                                          ? AppDarkColors.primary
                                          : MyColors.primary,
                                      secondary: context
                                              .watch<AppThemeCubit>()
                                              .isDarkMode
                                          ? AppDarkColors.accentColor
                                          : Colors.grey.shade200,
                                      onSurface: context
                                              .watch<AppThemeCubit>()
                                              .isDarkMode
                                          ? AppDarkColors.secondary
                                          : MyColors.primary,
                                    ),
                                  ),
                                  child: child!,
                                );
                              },
                            );
                            if (context.mounted) {
                              ReportsCubit.get(context).changeReportDateRange();
                            }
                          },
                          child: FieldSection(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: context
                                          .watch<ReportsCubit>()
                                          .reportFormattedDateFrom
                                          .isEmpty
                                      ? Text(
                                          tr(context, 'chooseDuration'),
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                            color: context
                                                    .watch<AppThemeCubit>()
                                                    .isDarkMode
                                                ? Colors.white
                                                : Colors.grey,
                                          ),
                                        )
                                      : Text(
                                          '${tr(context, 'from')} ${context.watch<ReportsCubit>().reportFormattedDateFrom} ${tr(context, 'to')} ${context.watch<ReportsCubit>().reportFormattedDateTo}',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w700,
                                            color: context
                                                    .watch<AppThemeCubit>()
                                                    .isDarkMode
                                                ? Colors.white
                                                : Colors.black54,
                                          ),
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
                      )
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.r),
                  child: FieldSection(
                    isBlack: true,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        // value: null,
                        hint: Text(
                          tr(context, 'viewTransactionsContent'),
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: context.watch<AppThemeCubit>().isDarkMode
                                ? Colors.white
                                : Colors.black87,
                          ),
                        ),
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: context.watch<AppThemeCubit>().isDarkMode
                              ? AppDarkColors.secondary
                              : MyColors.primary,
                        ),
                        menuMaxHeight: 0.3.sh,
                        items: (ReportsCubit.get(context)
                                        .reportFilteredTransactions
                                        .isEmpty &&
                                    ReportsCubit.get(context)
                                        .selectedWallet
                                        .isEmpty
                                ? ReportsCubit.get(context).transactions
                                : ReportsCubit.get(context)
                                    .reportFilteredTransactions)
                            .map(
                              (transaction) => DropdownMenuItem(
                                value: transaction.transactionType!.name,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      tr(
                                                  context,
                                                  transaction
                                                      .transactionContent!
                                                      .name!)
                                              .isNotEmpty
                                          ? tr(
                                              context,
                                              transaction
                                                  .transactionContent!.name!)
                                          : transaction
                                                  .transactionContent?.name ??
                                              "",
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        color: context
                                                .watch<AppThemeCubit>()
                                                .isDarkMode
                                            ? Colors.white
                                            : Colors.black87,
                                      ),
                                    ),
                                    Text(
                                      transaction.total!
                                          .formatToDecimal(context: context),
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        color: context
                                                .watch<AppThemeCubit>()
                                                .isDarkMode
                                            ? Colors.white
                                            : Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          // ReportsCubit.get(context).changeWallet(value!);
                        },
                      ),
                    ),
                  ),
                ),
                if (context.read<ReportsCubit>().transactions.isEmpty ||
                    context.watch<ReportsCubit>().categoriesList.isEmpty)
                  SizedBox(
                    height: 0.5.sh,
                    child: Center(
                      child: Text(
                        tr(context, 'noRecord'),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                if (context
                    .watch<ReportsCubit>()
                    .categoriesList
                    .isNotEmpty) ...[
                  SizedBox(height: 16.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.r),
                    child: AspectRatio(
                      aspectRatio: 1.5,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      tr(context, 'reportTotalResidual')
                                          .split(' ')
                                          .join('\n'),
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                    Text(
                                      context
                                          .watch<ReportsCubit>()
                                          .residualMoney
                                          .toString()
                                          .formatToDecimal(context: context),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp,
                                        color: const Color(0xFF5DE062),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      tr(context, 'totalSources')
                                          .split(' ')
                                          .join('\n'),
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                    Text(
                                      context
                                          .watch<ReportsCubit>()
                                          .totalMoney
                                          .toString()
                                          .formatToDecimal(context: context),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp,
                                        color: Colors.lightBlue,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              '${tr(context, 'reportTotal').split(' ').join('\n')}\n${context.watch<ReportsCubit>().allSpentMoney.toString().formatToDecimal(context: context)}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          PieChart(
                            PieChartData(
                              startDegreeOffset: -90,
                              sectionsSpace: 3.r,
                              centerSpaceRadius: 0.15.sw,
                              sections: context
                                  .watch<ReportsCubit>()
                                  .categoriesList
                                  .asMap()
                                  .entries
                                  .map(
                                    (entry) => PieChartSectionData(
                                      value: entry.value.percentage,
                                      badgeWidget: entry.value.percentage < 0.05
                                          ? null
                                          : Text(
                                              '${NumberFormat.percentPattern('en').format(entry.value.percentage)}\n${(tr(context, entry.value.title).isNotEmpty ? tr(context, entry.value.title) : entry.value.title).split(' ').join('\n')}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.sp,
                                                overflow: TextOverflow.ellipsis,
                                                color: Colors.black,
                                              ),
                                              maxLines:
                                                  entry.value.percentage <= 0.1
                                                      ? 1
                                                      : entry.value
                                                                  .percentage <=
                                                              0.15
                                                          ? 2
                                                          : 3,
                                              textAlign: TextAlign.center,
                                            ),
                                      showTitle: false,
                                      radius: 75.r,
                                      color: context
                                          .read<ReportsCubit>()
                                          .randomColors[entry.key],
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 18.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.r),
                    child: Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      columnWidths: const {
                        0: FractionColumnWidth(0.55),
                        1: FractionColumnWidth(0.3),
                        2: FractionColumnWidth(0.15),
                      },
                      children: [
                        TableRow(
                          children: [
                            Text(
                              tr(context, 'reportCategory'),
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              tr(context, 'reportCash'),
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '%',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            SizedBox(height: 10.h),
                            SizedBox(height: 10.h),
                            SizedBox(height: 10.h),
                          ],
                        ),
                        ...context
                            .watch<ReportsCubit>()
                            .categoriesList
                            .asMap()
                            .entries
                            .map(
                              (entry) => TableRow(
                                children: [
                                  ReportsRowCell(
                                    title: tr(context, entry.value.title)
                                            .isNotEmpty
                                        ? tr(context, entry.value.title)
                                        : entry.value.title,
                                    isCategory: true,
                                    categoryColor: context
                                        .read<ReportsCubit>()
                                        .randomColors[entry.key],
                                  ),
                                  ReportsRowCell(
                                    title: entry.value.totalMoney
                                        .toString()
                                        .formatToDecimal(context: context),
                                  ),
                                  ReportsRowCell(
                                    title: NumberFormat.percentPattern('en')
                                        .format(entry.value.percentage),
                                    isCenter: true,
                                  ),
                                ],
                              ),
                            )
                            .toList(),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
        const SaveAndShareButtons(),
      ],
    );
  }
}
