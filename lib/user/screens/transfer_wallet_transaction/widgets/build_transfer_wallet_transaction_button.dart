part of 'transfer_wallet_transaction_widgets_imports.dart';

class BuildTransferWalletTransactionButton extends StatelessWidget {
  const BuildTransferWalletTransactionButton({Key? key, required this.transferData, required this.model}) : super(key: key);
  final TransferWalletTransactionData transferData;
  final AddTransactionModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.r),
      child: DefaultButton(
        onTap: ()=>transferData.editWallet(context, model),
        title: tr(context, "transfer"),
        fontWeight: FontWeight.bold,
        fontSize: 14.sp,
      ),
    );
  }
}
