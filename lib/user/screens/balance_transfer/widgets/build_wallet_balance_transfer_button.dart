part of 'wallet_balance_transfer_widgets_imports.dart';

class BuildWalletBalanceTransferButton extends StatelessWidget {
  const BuildWalletBalanceTransferButton({Key? key, required this.data, required this.model}) : super(key: key);
  final WalletBalanceTransferData data;
  final WalletModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.r),
      child: DefaultButton(
        onTap: ()=>data.balanceTransfer(context, model),
        title: tr(context, "transfer"),
        fontWeight: FontWeight.bold,
        fontSize: 14.sp,
      ),
    );
  }
}
