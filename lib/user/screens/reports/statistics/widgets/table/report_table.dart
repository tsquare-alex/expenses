part of '../../statistics_imports.dart';

class ReportTable extends StatelessWidget {
  const ReportTable({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<AddTransactionModel> data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Table(
        defaultColumnWidth: const MaxColumnWidth(
          IntrinsicColumnWidth(),
          FlexColumnWidth(),
        ),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        border: TableBorder.all(
          borderRadius: BorderRadius.circular(12.r),
          color: context.watch<AppThemeCubit>().isDarkMode
              ? AppDarkColors.accentColor
              : MyColors.greyWhite,
          width: 2.r,
        ),
        children: [
          TableRow(
            children: [
              StatsRowCell(title: tr(context, 'tableWallet'), padding: 10),
              StatsRowCell(title: tr(context, 'tableTransaction'), padding: 10),
              StatsRowCell(
                  title: tr(context, 'tableSubTransaction'), padding: 10),
              StatsRowCell(title: tr(context, 'tableDuration'), padding: 10),
              StatsRowCell(title: tr(context, 'tablePriority'), padding: 10),
              StatsRowCell(title: tr(context, 'tableAmount'), padding: 10),
              StatsRowCell(title: tr(context, 'tableValue'), padding: 10),
              StatsRowCell(title: tr(context, 'tableContact'), padding: 10),
            ],
          ),
          ...data
              .map(
                (transaction) => TableRow(
                  children: [
                    StatsRowCell(
                      title: tr(context, transaction.incomeSource!.name).isEmpty
                          ? transaction.incomeSource?.name
                          : tr(context, transaction.incomeSource!.name),
                    ),
                    StatsRowCell(
                      title: tr(context, transaction.transactionType!.name!)
                              .isEmpty
                          ? transaction.transactionType?.name
                          : tr(context, transaction.transactionType!.name!),
                    ),
                    StatsRowCell(
                      title: transaction.transactionContent != null
                          ? tr(context, transaction.transactionContent!.name!)
                                  .isEmpty
                              ? transaction.transactionContent!.name
                              : tr(context,
                                  transaction.transactionContent!.name!)
                          : tr(context, transaction.transactionType!.name!)
                                  .isEmpty
                              ? transaction.transactionType!.name
                              : tr(context, transaction.transactionType!.name!),
                    ),
                    StatsRowCell(title: transaction.transactionDate),
                    StatsRowCell(
                      title: transaction.priority != null
                          ? tr(context, transaction.priority!.name!).isEmpty
                              ? transaction.priority?.name
                              : tr(context, transaction.priority!.name!)
                          : null,
                    ),
                    StatsRowCell(
                      title: tr(
                                  context,
                                  transaction.unit == null
                                      ? ''
                                      : transaction.unit!.name!)
                              .isEmpty
                          ? transaction.unit?.name
                          : tr(context, transaction.unit!.name!),
                    ),
                    StatsRowCell(
                        title: transaction.total!
                            .formatToDecimal(context: context)),
                    StatsRowCell(title: transaction.database?.name),
                  ],
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}

class StatsRowCell extends StatelessWidget {
  const StatsRowCell({
    Key? key,
    required this.title,
    this.padding,
  }) : super(key: key);

  final String? title;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding ?? 20.r, horizontal: 5.r),
      child: Text(
        title ?? '',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
