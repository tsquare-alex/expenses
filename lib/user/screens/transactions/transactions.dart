part of 'transactions_imports.dart';

class Transactions extends StatefulWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {

  TransactionsData data = TransactionsData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: MyColors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => AutoRouter.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        title: MyText(
          title: "المعاملات والمصروفات",
          color: MyColors.txtColor,
          size: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
