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
    data.fetchData(widget.model,context);
    data.iterateCubit.onUpdateData(widget.model.repeated!=null?true:false);
    data.notifyCubit.onUpdateData(widget.model.notify??false);
    data.selectedIterateTransaction= widget.model.repeated;
    data.selectedUnit= widget.model.unit;
    data.selectedWalletModel= widget.model.incomeSource;
    data.selectedBudget= widget.model.budget;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Padding(
          padding: EdgeInsets.only(left: 40.0.r),
          child: MyText(
            title: tr(context, "transactionDetails"),
            color: MyColors.black,
            size: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: InkWell(
          onTap: () => AutoRouter.of(context).pop(),
          child: Icon(Icons.arrow_back, color: MyColors.black,),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.r),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BuildTransactionDetailsInputs(transactionDetailsData: data,model: widget.model,),
              BuildTransactionDetailsButton(data: data, model: widget.model),
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
