part of 'recurring_transactions_imports.dart';

class RecurringTransactions extends StatefulWidget {
  const RecurringTransactions({Key? key}) : super(key: key);

  @override
  State<RecurringTransactions> createState() => _RecurringTransactionsState();
}

class _RecurringTransactionsState extends State<RecurringTransactions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          title: "المعاملات المتكررة",
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
