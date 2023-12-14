part of 'add_transaction_imports.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({Key? key, required this.model, required this.transactionType}) : super(key: key);
  final TransactionContentModel model;
  final String transactionType;
  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {

  AddTransactionData data = AddTransactionData();

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
          title: "إضافة معاملة",
          color: MyColors.white,
          size: 16.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0.r),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              BuildTransactionPrice(data: data),
              BuildTransactionType(data: data, model: widget.model, transactionType: widget.transactionType),
              BuildTransactionWallet(data: data),
              BuildTransactionDescription(data: data),
              BuildTransactionDate(data: data),
              BuildIterateTransaction(),
              BuildTransactionButton(),

            ],
          ),
        ),
      ),
    );
  }
}
