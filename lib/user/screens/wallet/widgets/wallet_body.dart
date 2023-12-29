import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/utilities/routers/RouterImports.gr.dart';
import 'package:expenses/user/screens/wallet/data/cubit/wallet_cubit/wallet_cubit.dart';
import 'package:expenses/user/screens/wallet/data/cubit/wallet_cubit/wallet_state.dart';
import 'package:expenses/user/screens/wallet/data/model/wallet_model.dart';
import 'package:expenses/user/screens/wallet/widgets/cstom_container.dart';
import 'package:expenses/user/screens/wallet/widgets/wallet_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WalletBody extends StatefulWidget {
  const WalletBody({super.key});

  @override
  State<WalletBody> createState() => _WalletBodyState();
}

class _WalletBodyState extends State<WalletBody> {
  @override
  void initState() {
    BlocProvider.of<WalletCubit>(context).fetchAllData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<WalletModel> wallet;
    bool isHide = false;

    return BlocBuilder<WalletCubit, WalletState>(
      builder: (context, state) {
        wallet = BlocProvider.of<WalletCubit>(context).walletList;
        wallet.sort((a, b) => b.checkedValue ? 1 : -1);
        return Scaffold(
          body: wallet.isEmpty
              ? const WalletCategory()
              : Padding(
                  padding: EdgeInsets.all(12.w),
                  child: ListView.builder(
                      itemCount: wallet.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        Gradient itemGradient = index % 2 == 0
                            ? const LinearGradient(
                                colors: [Color(0xff24C6DC), Color(0xff514A9D)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              )
                            : const LinearGradient(
                                colors: [Color(0xffC33764), Color(0xff1D2671)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              );
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.h),
                          child: CustomContainer(
                            model: wallet[index],
                            gradient: itemGradient,
                          ),
                        );
                      }),
                ),
          floatingActionButton: Visibility(
            visible: wallet.isEmpty ? isHide = false : isHide = true,
            child: FloatingActionButton(
              onPressed: () {
                AutoRouter.of(context).push(const WalletCategoryRoute());
              },
              backgroundColor: MyColors.primary,
              child: Icon(
                Icons.add,
                size: 20.sp,
                color: MyColors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
