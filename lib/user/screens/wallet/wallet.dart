part of 'wallet_imports.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {

  WalletData data = WalletData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: MyColors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => AutoRouter.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        title: MyText(
          title: "المحافظ والمصادر",
          color: MyColors.txtColor,
          size: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
