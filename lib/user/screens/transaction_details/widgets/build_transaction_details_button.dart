part of 'transaction_details_widgets_imports.dart';

class BuildTransactionDetailsButton extends StatelessWidget {
  const BuildTransactionDetailsButton({Key? key, required this.data, required this.model}) : super(key: key);
  final TransactionDetailsData data;
  final AddTransactionModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.r),
      child: DefaultButton(
        onTap: ()=>data.editTransaction(context, model),
        title: "تعديل المعاملة",
        fontWeight: FontWeight.bold,
        fontSize: 14.sp,
      ),
    );
  }
}
