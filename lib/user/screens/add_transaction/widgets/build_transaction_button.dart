part of 'add_transaction_widgets_imports.dart';

class BuildTransactionButton extends StatelessWidget {
  const BuildTransactionButton({Key? key, required this.data, required this.type}) : super(key: key);
  final AddTransactionData data;
  final String type;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.r),
      child: DefaultButton(
        onTap: ()=>data.addTransaction(context, type),
        title: "إضافة معاملة",
        fontWeight: FontWeight.bold,
        fontSize: 14.sp,
      ),
    );
  }
}
