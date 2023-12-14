part of 'transactions_imports.dart';

class Transactions extends StatefulWidget {
  const Transactions({Key? key,}) : super(key: key);
  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  TransactionsData data = TransactionsData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () =>AutoRouter.of(context).push(const TransactionsTypesRoute(),),
        backgroundColor: MyColors.primary,
        child: Icon(
          Icons.add,
          size: 20.sp,
          color: MyColors.white,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.r),
        child: const SingleChildScrollView(
          child: Column(
            children: [BuildNoRecord()],
          ),
        ),
      ),
    );
  }
}
