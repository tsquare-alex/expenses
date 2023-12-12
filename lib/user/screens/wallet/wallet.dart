part of 'wallet_imports.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  final WalletData data = WalletData();

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AutoRouter.of(context).push(const AddWalletRoute());
        },
        backgroundColor: MyColors.primary,
        child: Icon(
          Icons.add,
          size: 20.sp,
          color: MyColors.white,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12.w),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: 25.h,
            ),
            const CustomContainer(
              availableBalance: "الرصيد المتاح",
              balance: "5000",
              walletCategory: "حساب بنكي",
              walletNumber: "المحفظة الاولي",
            ),
          ],
        ),
      ),
    );
  }
}
