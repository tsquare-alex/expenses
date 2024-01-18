part of '../../statistics_imports.dart';

class ReportTable extends StatelessWidget {
  const ReportTable({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<AddTransactionModel> data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.r),
        child: Table(
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
                StatsRowCell(title: 'المحفظة', padding: 15),
                StatsRowCell(title: 'المعاملة', padding: 15),
                StatsRowCell(title: 'المعاملة الفرعية', padding: 15),
                StatsRowCell(title: 'الأولوية', padding: 15),
                StatsRowCell(title: 'القيمة', padding: 15),
              ],
            ),
            ...data
                .map(
                  (transaction) => TableRow(
                    children: [
                      StatsRowCell(title: transaction.incomeSource!.name),
                      StatsRowCell(title: transaction.transactionName!),
                      StatsRowCell(title: transaction.database!.adjective),
                      StatsRowCell(title: transaction.priority!.name!),
                      StatsRowCell(title: transaction.total!),
                    ],
                  ),
                )
                .toList(),
          ],
        ),
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

  final String title;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding ?? 20.r),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
