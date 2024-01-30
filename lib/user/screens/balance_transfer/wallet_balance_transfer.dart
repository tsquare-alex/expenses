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
        backgroundColor: context.watch<AppThemeCubit>().isDarkMode
            ? AppDarkColors.backgroundColor
            : MyColors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => AutoRouter.of(context).pop(),
          child: Icon(
            Icons.arrow_back,
            color: context.watch<AppThemeCubit>().isDarkMode
                ? MyColors.white
                : MyColors.black,
          ),
        ),
        centerTitle: true,
        title: MyText(
          title: tr(context, "transferBalanceBetweenWallets"),
          color: context.watch<AppThemeCubit>().isDarkMode
              ? MyColors.white
              : AppDarkColors.backgroundColor,
          size: 16.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.r),
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
