part of 'add_transaction_widgets_imports.dart';

class BuildTransactionButton extends StatelessWidget {
  const BuildTransactionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.r),
      child: DefaultButton(
        onTap: (){},
        title: "إضافة معاملة",
        fontWeight: FontWeight.bold,
        fontSize: 14.sp,
      ),
    );
  }
}
