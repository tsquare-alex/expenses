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
                                  color: Colors.grey,
                                ),
                              ),
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: MyColors.primary,
                              ),
                              menuMaxHeight: 0.3.sh,
                              items: [
                                    DropdownMenuItem(
                                      value: 'all',
                                      child: Text(
                                        tr(context, 'allWallets'),
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey,
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
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey,
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
                            if (ReportsCubit.get(context)
                                .selectedWallet
                                .isEmpty) {
                              return;
                            }
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
                                      secondary: Colors.grey.shade200,
                                      onSurface: context
                                              .watch<AppThemeCubit>()
                                              .isDarkMode
                                          ? AppDarkColors.primary
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
                                  child: Text(
                                    context
                                            .watch<ReportsCubit>()
                                            .reportFormattedDateFrom
                                            .isEmpty
                                        ? tr(context, 'chooseDuration')
                                        : '${tr(context, 'from')} ${context.watch<ReportsCubit>().reportFormattedDateFrom} ${tr(context, 'to')} ${context.watch<ReportsCubit>().reportFormattedDateTo}',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                    ),
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
                      )
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.r),
                  child: FieldSection(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        // value:
                        //     context.watch<ReportsCubit>().selectedWallet.isEmpty
                        //         ? null
                        //         : context.watch<ReportsCubit>().selectedWallet,
                        hint: Text(
                          tr(context, 'chooseTransactions'),
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: MyColors.primary,
                        ),
                        menuMaxHeight: 0.3.sh,
                        items: ReportsCubit.get(context)
                            .reportFilteredTransactions
                            .map(
                              (transaction) => DropdownMenuItem(
                                value: transaction.transactionType!.name,
                                child: Text(
                                  tr(context,
                                      transaction.transactionContent!.name!),
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
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
                SizedBox(height: 16.h),
                // const CircularPercentage(),
                SizedBox(
                  width: 300,
                  height: 300,
                  child: PieChart(
                    PieChartData(
                      borderData: FlBorderData(show: false),
                      centerSpaceRadius: 60.r,
                      sectionsSpace: 5.w,
                      sections: context
                          .watch<ReportsCubit>()
                          .categoriesList
                          .map(
                            (category) => PieChartSectionData(
                              title: tr(context, category.title),
                              color: category.color,
                              showTitle: true,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                SizedBox(height: 48.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.r),
                  child: Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    columnWidths: {
                      0: FractionColumnWidth(0.55),
                      1: FractionColumnWidth(0.3),
                      2: FractionColumnWidth(0.15),
                    },
                    children: [
                      TableRow(
                        children: [
                          Text(
                            'الفئة',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'مبلغ',
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
                      ...context
                          .watch<ReportsCubit>()
                          .categoriesList
                          .map(
                            (category) => TableRow(
                              children: [
                                ReportsRowCell(
                                  title: tr(context, category.title),
                                  isCategory: true,
                                  categoryColor: category.color,
                                ),
                                ReportsRowCell(
                                  title: category.totalMoney.toStringAsFixed(0),
                                ),
                                ReportsRowCell(
                                  title: NumberFormat.percentPattern('en')
                                      .format(category.percentage),
                                  isCenter: true,
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ],
                  ),
                ),
                // ListView.builder(
                //   shrinkWrap: true,
                //   itemCount: ReportsCubit.get(context)
                //           .reportFilteredTransactions
                //           .isEmpty
                //       ? ReportsCubit.get(context).transactions.length
                //       : ReportsCubit.get(context)
                //           .reportFilteredTransactions
                //           .length,
                //   itemBuilder: (context, index) => TransactionTile(
                //     transaction: ReportsCubit.get(context)
                //             .reportFilteredTransactions
                //             .isEmpty
                //         ? ReportsCubit.get(context).transactions[index]
                //         : ReportsCubit.get(context)
                //             .reportFilteredTransactions[index],
                //   ),
                // ),
              ],
            ),
          ),
        ),
        const SaveAndShareButtons(),
      ],
    );
  }
}
