part of 'wallet_imports.dart';

class WalletData {
  showButtomSheet(context, build, model) {
    showModalBottomSheet(
        isScrollControlled: true,
        elevation: 0,
        context: context,
        builder: (buildContext) {
          return WalletDetails(model: model);
        });
  }

  List<String> walletType = ["مصروف الشهر", "حساب بنكي"];
  List<String> paymentMethod = ["بطاقة ائتمان", "نقدي"];

  balanceTransaction(
      BuildContext context, String title, VoidCallback? onPressed) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: const AlertDialgBody(),
        );
      },
    );
  }
}
