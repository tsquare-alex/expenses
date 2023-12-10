part of 'cash_transactions_imports.dart';

class CashTransactions extends StatefulWidget {
  const CashTransactions({Key? key}) : super(key: key);

  @override
  State<CashTransactions> createState() => _CashTransactionsState();
}

class _CashTransactionsState extends State<CashTransactions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        elevation: 0,
        leading: IconButton(
          onPressed: () => AutoRouter.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: MyColors.white,
            size: 20.sp,
          ),
        ),
        centerTitle: true,
        title: MyText(
          title: "الأهداف المالية",
          color: MyColors.white,
          size: 16.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
