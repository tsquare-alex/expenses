part of 'cash_transactions_imports.dart';

class CashTransactions extends StatefulWidget {
  const CashTransactions({Key? key, }) : super(key: key);

  @override
  State<CashTransactions> createState() => _CashTransactionsState();
}

class _CashTransactionsState extends State<CashTransactions> {

  CashTransactionsData data = CashTransactionsData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>AutoRouter.of(context).push(AddTransactionRoute(model: data.model,),),
        backgroundColor: MyColors.primary,
        shape: const CircleBorder(),
        child: Icon(Icons.add,color: MyColors.white,),
      ),
      body: const Column(
        children: [
          BuildNoRecord(),
        ],
      ),
    );
  }
}
