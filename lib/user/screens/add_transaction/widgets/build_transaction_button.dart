part of 'add_transaction_widgets_imports.dart';

class BuildTransactionButton extends StatelessWidget {
  const BuildTransactionButton({Key? key, required this.data, required this.type, required this.transactionType,}) : super(key: key);
  final AddTransactionData data;
  final TransactionTypeModel transactionType;
  final String type;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.r),
      child: DefaultButton(
        onTap: ()=>data.addTransaction(context, type,transactionType),
        title: tr(context, "add"),
        fontWeight: FontWeight.bold,
        fontSize: 16.sp,
      ),
    );
  }
}
