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
  void initState() {
    data.fetchData(widget.model);
    data.iterateCubit.onUpdateData(widget.model.repeated!=null?true:false);
    data.notifyCubit.onUpdateData(widget.model.notify??false);
    data.selectedIterateTransaction= widget.model.repeated;
    data.selectedUnit= widget.model.unit;
    super.initState();
  }

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
      body: Padding(
        padding: EdgeInsets.all(15.r),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BuildTransactionDetailsInputs(transactionDetailsData: data,model: widget.model,),
              BuildTransactionDetailsButton(data: data, model: widget.model!),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    data.transactionTypeController.dispose();
    data.transactionContentController.dispose();
    data.amountController.dispose();
    data.totalController.dispose();
    data.partyController.dispose();
    data.walletController.dispose();
    data.transactionDateController.dispose();
    data.timeController.dispose();
    data.brandNameController.dispose();

    super.dispose();
  }
}
