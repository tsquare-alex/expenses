part of 'reports_widgets_imports.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  final AddTransactionModel transaction;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.r),
      child: ListTile(
        titleAlignment: ListTileTitleAlignment.center,
        contentPadding: EdgeInsets.only(left: 25.r, right: 16.r),
        title: Text(
          "${transaction.transactionName == "الالتزامات" || transaction.transactionName == "التسوق والشراء" ? transaction.transactionType!.name! : transaction.transactionName == "الاهداف المالية المستهدفة" ? transaction.targetType?.name : transaction.transactionName == "المعاملات النقدية" ? transaction.cashTransactionType?.name : ""}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13.sp,
          ),
        ),
        subtitle: Text(
          DateFormat('EEE, dd MMMM yyyy').format(
              DateFormat('dd MMMM yyyy', 'en')
                  .parse(transaction.transactionDate!)),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 11.sp,
            color: Colors.grey,
          ),
        ),
        trailing: Text(
          '- ${NumberFormat('##0.00').format(double.parse(transaction.total!))}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.sp,
            color: Colors.red.shade300,
          ),
        ),
      ),
    );
  }
}
