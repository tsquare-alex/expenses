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
          title: tr(context, "showTransactions"),
          color: MyColors.white,
          size: 16.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.r),
        child: BuildWalletTransactionsView(data: data),
      ),
    );
  }

}
