part of 'transaction_details_imports.dart';

class TransactionDetails extends StatefulWidget {
  const TransactionDetails({Key? key, required this.model}) : super(key: key);
  final AddTransactionModel model;

  @override
  State<TransactionDetails> createState() => _TransactionDetailsState();
}

class _TransactionDetailsState extends State<TransactionDetails> {

  TransactionDetailsData data = TransactionDetailsData();



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
          title: "تفاصيل المعاملة",
          color: MyColors.white,
          size: 16.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  void dispose() {
    data.endDateController.dispose();
    data.startDateController.clear();

    super.dispose();
  }
}
