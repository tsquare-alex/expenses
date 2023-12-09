part of 'add_transaction_imports.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({Key? key}) : super(key: key);

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: MyColors.white,
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
          title: "أصناف/أنواع المعاملات",
          color: MyColors.white,
          size: 16.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: const [
            // Content for Tab 1
            BuildTransactionsView(),

          ],
        ),
      ),
    );
  }
}
