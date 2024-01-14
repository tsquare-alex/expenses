part of 'reports_widgets_imports.dart';

class ReportsBody extends StatelessWidget {
  const ReportsBody({
    super.key,
    required this.data,
  });

  final ReportsData data;

  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = ReportsCubit.get(context).getCurrentLocale(context);
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
                        value:
                            context.watch<ReportsCubit>().selectedWallet.isEmpty
                                ? null
                                : context.watch<ReportsCubit>().selectedWallet,
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
                        items: [
                              DropdownMenuItem(
                                value: 'all',
                                child: Text(
                                  '',
                                  // tr(context, 'allWallets'),
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
                SizedBox(height: 16.h),
                const CircularPercentage(),
                SizedBox(height: 32.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.r),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        tr(context, 'transactionsHistory'),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () =>
                            showReportOptionsModalSheet(context: context),
                        style: OutlinedButton.styleFrom(
                          fixedSize: const Size(149, 42),
                          elevation: 0,
                          padding: EdgeInsets.symmetric(horizontal: 14.r),
                          side: BorderSide(color: MyColors.primary),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        child: Text(
                          tr(context, 'showDetails'),
                          style: TextStyle(
                            color: MyColors.primary,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: ReportsCubit.get(context)
                          .reportFilteredTransactions
                          .isEmpty
                      ? ReportsCubit.get(context).transactions.length
                      : ReportsCubit.get(context)
                          .reportFilteredTransactions
                          .length,
                  itemBuilder: (context, index) => TransactionTile(
                    transaction: ReportsCubit.get(context)
                            .reportFilteredTransactions
                            .isEmpty
                        ? ReportsCubit.get(context).transactions[index]
                        : ReportsCubit.get(context)
                            .reportFilteredTransactions[index],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SaveAndShareButtons(),
      ],
    );
  }
}
