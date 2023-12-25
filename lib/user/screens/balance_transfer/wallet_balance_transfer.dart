part of 'wallet_balance_transfer_imports.dart';

class WalletBalanceTransfer extends StatefulWidget {
  const WalletBalanceTransfer({Key? key, required this.model}) : super(key: key);
  final WalletModel model;

  @override
  State<WalletBalanceTransfer> createState() => _WalletBalanceTransferState();
}

class _WalletBalanceTransferState extends State<WalletBalanceTransfer> {

  WalletBalanceTransferData data = WalletBalanceTransferData();

  @override
  void initState() {
    data.walletController.text = widget.model.name;
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
          title: tr(context, "balanceTransfer"),
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
              BuildWalletBalanceTransferInputs(transferData: data,),
              BuildWalletBalanceTransferButton(data: data, model: widget.model,),
            ],
          ),
        ),
      ),
    );
  }
}
