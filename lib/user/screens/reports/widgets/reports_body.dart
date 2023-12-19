part of 'reports_widgets_imports.dart';

class ReportsBody extends StatelessWidget {
  const ReportsBody({
    super.key,
    required this.data,
  });

  final ReportsData data;

  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = data.getCurrentLocale(context);
    return Stack(
      children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10.r),
              child: const DatePickerField(),
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
            ...data.transactions
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
