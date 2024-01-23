part of '../../statistics_imports.dart';

class ReportTable extends StatelessWidget {
  const ReportTable({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<AddTransactionModel> data;

  @override
  Widget build(BuildContext context) {
    return Table(
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
        const TableRow(
          children: [
            StatsRowCell(title: 'محفظة', padding: 5),
            StatsRowCell(title: 'معاملة', padding: 5),
            StatsRowCell(title: 'معاملة\nفرعية', padding: 5),
            StatsRowCell(title: 'مدة', padding: 5),
            StatsRowCell(title: 'أولوية', padding: 5),
            StatsRowCell(title: 'كمية', padding: 5),
            StatsRowCell(title: 'قيمة', padding: 5),
            StatsRowCell(title: 'جهة', padding: 5),
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
                    title: tr(context, transaction.transactionContent!.name!)
                            .isEmpty
                        ? transaction.transactionContent?.name
                        : tr(context, transaction.transactionContent!.name!),
                  ),
                  StatsRowCell(title: transaction.transactionDate),
                  StatsRowCell(
                    title: tr(context, transaction.priority!.name!).isEmpty
                        ? transaction.priority?.name
                        : tr(context, transaction.priority!.name!),
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
                  StatsRowCell(title: transaction.total),
                  StatsRowCell(title: transaction.database?.name),
                ],
              ),
            )
            .toList(),
      ],
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
