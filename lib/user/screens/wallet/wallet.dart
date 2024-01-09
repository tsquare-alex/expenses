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
            // appBar: AppBar(
            //   backgroundColor: Colors.green,
            //   title: Row(
            //     children: [
            //       Image.asset(
            //         Res.wallet,
            //         width: 20.w,
            //         height: 20.h,
            //         color: MyColors.white,
            //       ),
            //       SizedBox(
            //         width: 10.w,
            //       ),
            //       MyText(
            //         title: tr(context, 'wallet'),
            //         color: Colors.white,
            //         size: 14.sp,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ],
            //   ),
            //   automaticallyImplyLeading: false,
            // ),
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
