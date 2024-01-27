part of 'wallet_imports.dart';

class Wallet extends StatelessWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WalletCubit(),
      child: BlocConsumer<WalletCubit, WalletState>(
        listener: (context, state) {
          if (state is WalletSuccess) {}
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: MyColors.white,
            body: const WalletBody(),
          );
        },
      ),
    );
  }
}
