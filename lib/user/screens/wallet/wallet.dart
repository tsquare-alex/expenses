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
            // floatingActionButton: FloatingActionButton(
            //   onPressed: () {
            //     AutoRouter.of(context).push(const WalletCategoryRoute());
            //   },
            //   backgroundColor: MyColors.primary,
            //   child: Icon(
            //     Icons.add,
            //     size: 20.sp,
            //     color: MyColors.white,
            //   ),
            // ),
            // floatingActionButton: FloatingActionButton(
            //   onPressed: () async {
            //     await AutoRouter.of(context).push(
            //       const AddWalletRoute(),
            //     );
            //     if (context.mounted) {
            //       context.read<WalletCubit>().fetchAllData();
            //     }
            //   },
            //   backgroundColor: MyColors.primary,
            //   child: Icon(
            //     Icons.add,
            //     size: 20.sp,
            //     color: MyColors.white,
            //   ),
            // ),
            body: const WalletBody(),
          );
        },
      ),
    );
  }
}
