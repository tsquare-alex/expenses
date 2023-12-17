part of 'reports_widgets_imports.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  final TransactionsModel transaction;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.r),
      child: ListTile(
        titleAlignment: ListTileTitleAlignment.center,
        contentPadding: EdgeInsets.only(left: 25.r, right: 16.r),
        title: Text(
          transaction.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13.r,
          ),
        ),
        subtitle: Text(
          transaction.time,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 11.r,
            color: Colors.grey,
          ),
        ),
        trailing: Text(
          transaction.cost,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.r,
            color: transaction.cost.startsWith('+')
                ? Colors.greenAccent.shade700
                : Colors.red.shade300,
          ),
        ),
      ),
    );
  }
}
