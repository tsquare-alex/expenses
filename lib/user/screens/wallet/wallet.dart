part of 'wallet_imports.dart';

class Wallet extends StatelessWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WalletCubit(),
      child: Scaffold(
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
        body: WalletBody(),
      ),
    );
  }
}
