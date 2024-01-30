part of 'transfer_wallet_transaction_imports.dart';

class TransferWalletTransaction extends StatefulWidget {
  const TransferWalletTransaction({Key? key, required this.model}) : super(key: key);
  final AddTransactionModel model;

  @override
  State<TransferWalletTransaction> createState() => _TransferWalletTransactionState();
}

class _TransferWalletTransactionState extends State<TransferWalletTransaction> {

  TransferWalletTransactionData data = TransferWalletTransactionData();

  @override
  void initState() {
    data.walletController.text = widget.model.incomeSource?.name??"";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.white,
        title: MyText(
          title: tr(context, "transactionTransfer"),
          color: MyColors.black,
          size: 18.sp,
          fontWeight: FontWeight.bold,
        ),
        leading: InkWell(
          onTap: () => AutoRouter.of(context).pop(),
          child: Icon(
            Icons.arrow_back,
            color: MyColors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.r),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BuildTransferWalletTransactionInputs(transferData: data,),
              BuildTransferWalletTransactionButton(transferData: data, model: widget.model,),
            ],
          ),
        ),
      ),
    );
  }
}
