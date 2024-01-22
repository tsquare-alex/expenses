import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/utilities/routers/RouterImports.gr.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/res.dart';
import 'package:expenses/user/screens/wallet/data/cubit/wallet_cubit/wallet_cubit.dart';
import 'package:expenses/user/screens/wallet/data/cubit/wallet_cubit/wallet_state.dart';
import 'package:expenses/user/screens/wallet/data/model/wallet/wallet_model.dart';
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
        wallet.sort((a, b) => b.checkedValue! ? 1 : -1);
        double totalBalance = context.read<WalletCubit>().calculateTotalBalance(
              wallet,
            );
        return Scaffold(
          appBar: AppBar(
            surfaceTintColor: Colors.transparent,
            leading: IconButton(
              icon: Image.asset(Res.back),
              onPressed: () => AutoRouter.of(context).pop(),
            ),
            backgroundColor: MyColors.white,
            title: Center(
              child: MyText(
                color: MyColors.black,
                size: 20.sp,
                fontWeight: FontWeight.bold,
                title: tr(context, "wallet"),
              ),
            ),
          ),
          body: wallet.isEmpty
              ? const WalletCategory()
              : Column(
                  children: [
                    SizedBox(
                      height: 24.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.r),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "إجمالي الرصيد",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: MyColors.black),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "$totalBalance",
                                style: TextStyle(
                                  fontSize: 32.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                "EGP",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: wallet.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 12.r, horizontal: 16.r),
                              child: CustomContainer(
                                model: wallet[index],
                              ),
                            );
                          }),
                    ),
                  ],
                ),
          floatingActionButton: Visibility(
            visible: wallet.isEmpty ? isHide = false : isHide = true,
            child: FloatingActionButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.r)),
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
