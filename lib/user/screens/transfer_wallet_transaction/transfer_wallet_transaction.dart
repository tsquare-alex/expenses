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
          title: tr(context, "transactionTransfer"),
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
              BuildTransferWalletTransactionInputs(transferData: data,),
              BuildTransferWalletTransactionButton(transferData: data, model: widget.model,),
            ],
          ),
        ),
      ),
    );
  }
}
