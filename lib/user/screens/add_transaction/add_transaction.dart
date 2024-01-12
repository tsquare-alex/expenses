part of 'add_transaction_imports.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({Key? key, required this.model, this.transactionName,}) : super(key: key);
  final TransactionTypeModel? model;
  final String? transactionName;

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {

  AddTransactionData data = AddTransactionData();

  @override
  void initState() {
    data.getContents(widget.model!,widget.transactionName!);
    data.selectedContent = null;
    print(data.selectedContent);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: MyColors.white,
        elevation: 0,
        backgroundColor: MyColors.white,
        leading: IconButton(
          onPressed: () => AutoRouter.of(context).pop(),
          icon: Icon(
            Icons.arrow_back,
            color: MyColors.black,
            size: 20.sp,
          ),
        ),
        centerTitle: true,
        title: MyText(
          title: tr(context, widget.model!.name!).isNotEmpty?tr(context, widget.model!.name!):widget.model?.name??"",
          color: MyColors.black,
          size: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0.r),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              BuildTransactionType(addTransactionData: data, type: widget.transactionName??"", model: widget.model!,),
              BuildTransactionInputs(addTransactionData: data, type: widget.transactionName??"",),
              BuildTransactionDate(data: data,type: widget.transactionName??""),
              if(widget.transactionName=="التسوق والشراء")BuildAddProductPhoto(data: data,),
              BuildIterateTransaction(addTransactionData: data,type: widget.transactionName??"",),
              BuildTransactionButton(data: data,type: widget.transactionName??"", transactionType: widget.model!,),

            ],
          ),
        ),
      ),
    );
  }
}
