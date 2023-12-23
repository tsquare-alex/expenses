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
    return Stack(
      children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10.r, 10.r, 10.r, 20.r),
              child: const DateField(),
            ),
            const DurationPickerField(),
            SizedBox(height: 20.h),
            const CircularPercentage(),
            SizedBox(height: 15.h),
            const CircularDetailsRow(),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    tr(context, 'transactionsHistory'),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.r,
                    ),
                  ),
                  Text(
                    tr(context, 'seeAll'),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.r,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            ...ReportsCubit.get(context)
                .transactions
                .map(
                  (transaction) => TransactionTile(transaction: transaction),
                )
                .toList(),
          ],
        ),
        const SaveAndShareButtons(),
      ],
    );
  }
}
