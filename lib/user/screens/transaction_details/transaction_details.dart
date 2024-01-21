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
    print("notify${widget.model.notify}");
    data.fetchData(widget.model,context);
    data.notifyCubit.onUpdateData(widget.model.notify??false);
    data.ratioCubit.onUpdateData(widget.model.ratio!=null?true:false);
    data.iterateCubit.onUpdateData(widget.model.repeated!=null?true:false);
    data.remainderCubit.onUpdateData(widget.model.putReminderInWallet??false);
    data.selectedIterateTransaction= widget.model.repeated;
    print(widget.model.repeated?.name);
    data.selectedUnit= widget.model.unit;
    data.selectedWalletModel= widget.model.incomeSource;
    data.selectedBudget= widget.model.budget;
    data.selectedRatio= widget.model.ratio;
    data.selectedPriority= widget.model.priority;
    data.descriptionController.text = widget.model.description??"";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: MyText(
          title: tr(context, "transactionDetails"),
          color: MyColors.black,
          size: 18.sp,
          fontWeight: FontWeight.bold,
        ),
        leading: InkWell(
          onTap: () => AutoRouter.of(context).pop(),
          child: Icon(Icons.arrow_back, color: MyColors.black,),
        ),
        actions: [
        Padding(
          padding: EdgeInsets.only(left:10.0.r),
          child: InkWell(
          onTap: ()=>data.deleteItem(widget.model, context),
          child: CircleAvatar(
            radius: 20.r,
            backgroundColor: MyColors.greyWhite,
            child: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),),
        ),
        ],
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
    data.initialValueController.dispose();
    data.requiredValueController.dispose();

    super.dispose();
  }
}
