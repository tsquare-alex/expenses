part of 'add_transaction_widgets_imports.dart';

class BuildTransactionsView extends StatelessWidget {
  const BuildTransactionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.r),
      child: const Column(
        children: [
          BuildTransactionItem(name: "المصروفات", image: Res.cart,),
          BuildTransactionItem(name: "ايداع فلوس", image: Res.cart,),
          BuildTransactionItem(name: "ايداع فلوس", image: Res.cart,),
          BuildTransactionItem(name: "ايداع فلوس", image: Res.cart,),
        ],
      ),
    );
  }
}
