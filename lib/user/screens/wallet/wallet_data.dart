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

  List<String> valueCategory = [
    "نقدي",
    "حساب بنكي",
    "تحويل بنكي",
    "موبايل كاش",
    "نقاط",
    "انستاباي",
  ];

  List<String> paymentMethod = ["تحويل بنكي", "حساب بنكي", "نقدي"];
  List<String> walletCategory = [
    "حافز",
    "راتب",
    "إضافي",
    "مكافأة",
    "هدايا",
    "حساب بنكي",
    "إيجار",
    "عائد مشروع",
    "صفقة",
  ];
  List<String> encomeSource = ["شخص", "جهة"];
  List<String> curancyType = ["ر.س", "ج.م"];
  List<String> repeatWallet = [
    "يومياً",
    "اسبوعياً",
    "شهرياً",
    "ربع سنوياً",
    "نصف سنوياً",
    "سنوياً",
  ];

  // balanceTransaction(
  //     BuildContext context, String title, VoidCallback? onPressed) {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         content: const AlertDialgBody(),
  //       );
  //     },
  //   );
  // }
}
