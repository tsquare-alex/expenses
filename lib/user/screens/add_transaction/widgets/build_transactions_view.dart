part of 'add_transaction_widgets_imports.dart';

class BuildTransactionsView extends StatelessWidget {
  const BuildTransactionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.r),
      child: Column(
        children: [
          BuildTransactionItem(
            name: "المصروفات",
            image: Res.cart,
            onTap: (){},
            content: Column(
              children: [],
            ),
          ),
          BuildTransactionItem(
            name: "الأهداف المالية المستهدفة",
            image: Res.cart,
          ),
          BuildTransactionItem(
            name: "المعاملات النقدية",
            image: Res.cart,
          ),
          BuildTransactionItem(
            name: "المعاملات المتكررة",
            image: Res.cart,
          ),
          BuildTransactionItem(
            name: "أخري/إضافة",
            image: Res.cart,
          ),
        ],
      ),
    );
  }
}
