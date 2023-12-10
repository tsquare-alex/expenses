part of 'wallet_imports.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key,}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {

  WalletData data = WalletData();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: MyColors.white,
      body: Column(
        children: [
          MyText(title: "wallet", color: MyColors.primary, size: 16.sp,fontWeight: FontWeight.bold,),
        ],
      ),
    );
  }
}
