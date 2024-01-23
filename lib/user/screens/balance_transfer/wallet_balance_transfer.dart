part of 'wallet_balance_transfer_imports.dart';

class WalletBalanceTransfer extends StatefulWidget {
  const WalletBalanceTransfer({Key? key, required this.model})
      : super(key: key);
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
        backgroundColor: MyColors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(Res.back),
          onPressed: () => AutoRouter.of(context).pop(),
        ),
        centerTitle: true,
        title: MyText(
          title: tr(context, "transferBalanceBetweenWallets"),
          color: MyColors.black,
          size: 16.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BuildWalletBalanceTransferInputs(
                transferData: data,
              ),
              BuildWalletBalanceTransferButton(
                data: data,
                model: widget.model,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
