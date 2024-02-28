part of 'wallet_transactions_imports.dart';

class WalletTransactions extends StatefulWidget {
  const WalletTransactions({Key? key, required this.model}) : super(key: key);
  final WalletModel model;
  @override
  State<WalletTransactions> createState() => _WalletTransactionsState();
}

class _WalletTransactionsState extends State<WalletTransactions> {
  WalletTransactionsData data = WalletTransactionsData();

  @override
  void initState() {
    data.getWalletTransactions(context, widget.model);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.watch<AppThemeCubit>().isDarkMode
            ? AppDarkColors.backgroundColor
            : MyColors.white,
        title: MyText(
          title: tr(context, "showTransactions"),
          color: context.watch<AppThemeCubit>().isDarkMode
              ? MyColors.white
              : MyColors.black,
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
        child: BuildWalletTransactionsView(
          data: data,
          walletModel: widget.model,
        ),
      ),
    );
  }
}
